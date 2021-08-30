require 'faker'

module Factory
  class Dynamic

    def self.usuarios
      {
        nome: Faker::Name.first_name,
        email: Faker::Internet.email,
        password: "1234",
        administrador: "true"
      }
    end

    def self.produto_novo
      {
        nome: Faker::Book.title,
        preco: "100",
        descricao: "111",
        quantidade: 381
      }
    end

  end
end
