#language: pt

@serverest_usuarios
Funcionalidade: ServeRest Usuários
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @cadastrar_usuarios_201
    Cenário: [POST] Cadastrar usuário 201
        Dado possuir dados de cadastro válidos
        Quando chamar o endpoint "/usuarios" com o método POST 
        Então validar retorno do status code 201
        
