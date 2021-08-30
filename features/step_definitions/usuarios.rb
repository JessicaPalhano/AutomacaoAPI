Dado('possuir dados de cadastro válidos') do
  @body = Factory::Dynamic.usuarios
  log('Nome: ' + @body[:nome])
  log('E-mail: ' + @body[:email])
end

Então("validar retorno de uma lista de usuários") do
  response_body_json = JSON.parse(@response.body)
  expect(response_body_json["usuarios"].size).to be > 1
  expect(response_body_json["usuarios"].class).to be_a_kind_of(Array.class)
end

Dado('possuir usuário cadastrado') do
  steps %{
    Dado possuir dados de cadastro válidos
    Quando chamar o endpoint "/usuarios" com o método POST 
    Então validar retorno do status code 201
  }
  response_body_json = JSON.parse(@response.body)
  @id = response_body_json["_id"]
end

Quando('chamar o endpoint {string} com parâmetros id alterando os dados do usuário') do |endpoint|
  @body_edit = {
    "nome": "Fulano da Silva",
    "email": @body[:email],
    "password": "teste",
    "administrador": "true"
  }
  @response = @serverest_api.put(endpoint + '/' + @id, @body_edit)
end
