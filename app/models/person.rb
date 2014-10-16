class Person
  include Neo4j::ActiveNode

  has_one :in, :account, model_class: User, origin: :role
end
