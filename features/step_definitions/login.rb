Dado('possuir dados de login {string}') do |tipo_usuario|
  @body = Factory::Static.static_data(tipo_usuario)
end



