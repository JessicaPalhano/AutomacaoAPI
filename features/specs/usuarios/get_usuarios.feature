#language: pt

@servrest_usuarios
Funcionalidade: ServeRest Usuários
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @listar_usuarios_200
    Cenário: [GET] Get usuarios 200
        Quando chamar o endpoint "/usuarios" com o método GET sem parâmetros
        Então validar retorno do status code 200
        E deverá retornar uma lista de usuários