#language: pt

@serverest_produtos
Funcionalidade: ServeRest Produto
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @listar_produtos_200
    Cenário: [GET] Listar produtos
        Quando chamar o endpoint "/produtos" com o método GET
        Então validar retorno do status code 200

    @buscar_produto_id
    Cenário: [GET] Buscar produtos por id
        Dado possuir produto cadastrado
        Quando chamar o endpoint "/produtos" com o método GET com parâmetros
        Então validar retorno do status code 200
