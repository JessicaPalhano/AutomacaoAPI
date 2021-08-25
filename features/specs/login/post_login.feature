#language: pt

@servrest_login
Funcionalidade: ServeRest User
    Como uma aplicação xpto
    Gostaria de poder realizar login
    Para poder garantir seu status e validação

    @login_200
    Esquema do Cenário: [POST] Post Login 
        Dado possuir dados de login "<tipo_usuario>"
        Quando chamar o endpoint "/login" com o método POST 
        Então validar retorno do status code <status>
        E validar o retorno da mensagem "<mensagem>"
          Exemplos:
            | tipo_usuario    | status | mensagem                        |
            | login_valido    |  200   |Login realizado com sucesso      |
            | email_invalido  |  401   |Email e/ou senha inválidos       |
            | senha_invalida  |  401   |Email e/ou senha inválidos       |          