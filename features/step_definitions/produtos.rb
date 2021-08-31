#language: pt

Dado ('possuir um token válido') do
  steps %{
    Dado possuir dados de login validos
    Quando chamar o endpoint "/login" com o método POST 
    Então validar retorno do status code 200
  }
  response_body_json = JSON.parse(@response.body)
  token = response_body_json["authorization"]
  @serverest_api.armazenar_token(token)
end

Dado ('possuir um produto válido para cadastrar') do
  @body = Factory::Dynamic.produto_novo
  log ('Nome do livro: ' +  @body[:nome])
end

Quando('chamar o endpoint {string} com o método POST com o token') do |endpoint|
  @response = @serverest_api.post_com_token(endpoint,@body)
  Utils.log_response(@response.body) 
end

Dado('possuir produto cadastrado') do
  steps %{
    Dado possuir um token válido
    Dado possuir um produto válido para cadastrar
    Quando chamar o endpoint "/produtos" com o método POST com o token
  }
  @response_body_json = JSON.parse(@response.body)
  @id = @response_body_json["_id"]
end

Quando('chamar o endpoint {string} com o método DELETE com token e com parâmetros') do |endpoint|
  @response = @serverest_api.delete_com_token(endpoint + '/' + @id)
end

Quando('chamar o endpoint {string} com parâmetros id alterando os dados do produto') do |endpoint|
  @body_edit = {
    nome: Faker::Book.title + ", pelo autor: " + Faker::Name.name,
    preco: "100",
    descricao: "111",
    quantidade: 10
  }
  @response = @serverest_api.put_com_token(endpoint + "/" +@id, @body_edit)
end
