#language: pt

Quando('chamar o endpoint {string} com o método GET') do |endpoint|
  @response = @serverest.get(endpoint)
  Utils.log_response(@response.body)
  log(@response.status)
end

Dado ('possuir um token válido') do
  @body = Factory::Static.static_data('login_valido')
  @response = @serverest_api.post("/login", @body)
  Utils.log_response(@response.body) 
  expect(@response.status).to eq 200
  response_body_json = JSON.parse(@response.body)
  expect(response_body_json["message"]).to eq "Login realizado com sucesso"
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
  @body = Factory::Static.static_data('login_valido')
  @response = @serverest_api.post('/login', @body)
  @response_body_json = JSON.parse(@response.body)
  expect(@response.status).to eq 200
  token = @response_body_json["authorization"]
  @serverest_api.armazenar_token(token)
  @body = Factory::Dynamic.produto_novo
  @response = @serverest_api.post_com_token('/produtos', @body)
  @response_body_json = JSON.parse(@response.body)
  @id = @response_body_json["_id"]
end

Quando('chamar o endpoint {string} com o método DELETE com token e com parâmetros') do |endpoint|
  @response = @serverest_api.delete_com_token(endpoint + '/' + @id)
end

