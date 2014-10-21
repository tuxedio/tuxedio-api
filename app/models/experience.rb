class Experience
  include Neo4j::ActiveNode

  has_one :in, :host, model_class: false

  property :name
  property :location
  property :description

  validates :name,        presence: true, length: { maximum: 50 }
  validates :location,    presence: true, length: { maximum: 30 }
end
