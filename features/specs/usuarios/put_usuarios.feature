#language: pt

@serverest_usuarios
Funcionalidade: ServeRest Usuários
    Como uma aplicação xpto
    Gostaria de poder chamar os endpoints da API ServeRest
    Para poder garantir seus status e validações

    @editar_usuarios_200
    Cenário: [PUT] Editar usuário por id
        Dado possuir usuário cadastrado
        Quando chamar o endpoint "/usuarios" com parâmetros id alterando os dados do usuário
        Então validar retorno do status code 200
        E validar o retorno da mensagem "Registro alterado com sucesso"
        
