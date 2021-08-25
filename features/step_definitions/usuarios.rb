Dado('possuir dados de cadastro válidos') do
  @body = Factory::Dynamic.valid_user
  log('Nome: ' + @body[:nome])
  log('E-mail: ' + @body[:email])
end

Então("deverá retornar uma lista de usuários") do
  response_body_json = JSON.parse(@response.body)
  expect(response_body_json["usuarios"].size).to be > 1
  expect(response_body_json["usuarios"].class).to be_a_kind_of(Array.class)
end

Dado('possuir usuário cadastrado') do
  @body= Factory::Dynamic.valid_user
  log('Nome: ' + @body[:nome])
  log('E-mail: ' + @body[:email])
  @response_usuario = @serverest_api.post('/usuarios', @body)
  Utils.log_response(@response_usuario.body)
  expect(@response_usuario.status).to eq 201
  response_body_json = JSON.parse(@response_usuario.body)
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









