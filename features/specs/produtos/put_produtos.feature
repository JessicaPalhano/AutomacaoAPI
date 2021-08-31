#language: pt

@serverest_produtos
Funcionalidade: ServeRest Produto
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @editar_produtos
    Cenário: [PUT] Editar produtos 200
        Dado possuir produto cadastrado
        Quando chamar o endpoint "/produtos" com parâmetros id alterando os dados do produto 
        Então validar retorno do status code 200
