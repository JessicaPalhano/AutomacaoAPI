#language: pt

@serverest_produtos
Funcionalidade: ServeRest Produto
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @cadastrar_produto
    Cenário: [POST] Cadastrar produto 201
        Dado possuir um token válido
        E possuir um produto válido para cadastrar
        Quando chamar o endpoint "/produtos" com o método POST com o token
        Então validar retorno do status code 201        
