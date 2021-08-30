#language: pt

@serverest_login
Funcionalidade: ServeRest Login
    Como uma aplicação xpto
    Gostaria de poder realizar login
    Para poder garantir seu status e validação

    @login_200
    Cenário: [POST] Realizar login 
        Dado possuir dados de login validos
        Quando chamar o endpoint "/login" com o método POST 
        Então validar retorno do status code 200
        E validar o retorno da mensagem "Login realizado com sucesso"

    @login_401  
    Cenário: [POST] Realizar login 
        Dado possuir dados de login invalidos
        Quando chamar o endpoint "/login" com o método POST 
        Então validar retorno do status code 401
        E validar o retorno da mensagem "Email e/ou senha inválidos"
                     