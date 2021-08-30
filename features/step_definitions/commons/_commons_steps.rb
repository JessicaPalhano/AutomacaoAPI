Então('validar o retorno da mensagem {string}') do |mensagem|
  response_body_json = JSON.parse(@response.body)
  Utils.log_response(@response.body)
  expect(response_body_json["message"]).to eq mensagem
end

Então("validar retorno do status code {int}") do |status_code|
  expect(@response.status).to eq status_code
end

Quando("chamar o endpoint {string} com o método POST") do |endpoint|
  @response = @serverest_api.post(endpoint, @body)
end

Quando('chamar o endpoint {string} com o método GET') do |endpoint|
  @response = @serverest_api.get(endpoint)
  Utils.log_response(@response.body)
  log(@response.status)
end

Quando('chamar o endpoint {string} com o método GET com parâmetros') do |endpoint|
  @response = @serverest_api.get(endpoint + '/' + @id)
end

Quando('chamar o endpoint {string} com o método DELETE com parâmetros') do |endpoint|   
  @serverest_api.delete(endpoint)  
  @response = @serverest_api.delete(endpoint + '/' + @id)
 end  
 