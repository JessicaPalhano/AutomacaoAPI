Dado('possuir dados de login validos') do 
  steps %{
    Dado possuir dados de cadastro válidos
    Quando chamar o endpoint "/usuarios" com o método POST 
    Então validar retorno do status code 201
  }
  @body = {
    "email": @body[:email],
    "password": @body[:password]
  }
end

Dado('possuir dados de login invalidos') do
  @body = Factory::Static.static_data("login_invalido")
end
