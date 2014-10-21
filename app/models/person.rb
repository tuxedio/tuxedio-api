class Person
  include Neo4j::ActiveNode

  has_one :in, :account, model_class: User, origin: :role

  has_many :both, :friends, model_class: false
  has_many :out, :knows, model_class: self
  has_many :in, :knows_me, origin: :knows, model_class: self

  property :bio
  property :gender
  property :website
  property :hometown
  property :location
  property :name, index: :exact

  validates :bio,         presence: true, length: { maximum: 255 }
  validates :website,     format: URI::regexp(%w(http https))
  validates :gender,      inclusion: { in: ['male', 'female'] }, allow_nil: true
  validates :hometown,    length: { maximum: 30 }
  validates :location,    length: { maximum: 30 }
  validates :name,        presence: true, length: { maximum: 50  }
end
