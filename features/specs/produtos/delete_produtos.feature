#language: pt

@serverest_produtos
Funcionalidade: ServeRest Produto
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @excluir_produto
    Cenário: [DEL] Excluir produto por id
        Dado possuir produto cadastrado
        Quando chamar o endpoint "/produtos" com o método DELETE com token e com parâmetros 
        Então validar retorno do status code 200
        E validar o retorno da mensagem "Registro excluído com sucesso"
        