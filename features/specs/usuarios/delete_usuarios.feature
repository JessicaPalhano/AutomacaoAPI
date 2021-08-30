#language: pt

@serverest_usuarios
Funcionalidade: ServeRest Usuários
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @excluir_usuario
    Cenário: [DELETE] Excluir usuário por id
        Dado possuir usuário cadastrado
        Quando chamar o endpoint "/usuarios" com o método DELETE com parâmetros 
        Então validar o retorno da mensagem "Registro excluído com sucesso"
        
