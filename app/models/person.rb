class Person
  include Neo4j::ActiveNode

  has_one :in, :account, model_class: User, origin: :role

  has_many :out, :following, model_class: self
  has_many :in, :followers, origin: :following, model_class: self
  has_many :out, :hosted_experiences, model_class: Experience

  property :bio
  property :gender
  property :website
  property :hometown
  property :location
  property :name, index: :exact

  validates :bio,         presence: true, length: { maximum: 255 }
  validates :website,     format: URI::regexp(%w(http https))
  validates :gender,      inclusion: { in: %w(male female) }, allow_nil: true
  validates :hometown,    length: { maximum: 30 }
  validates :location,    length: { maximum: 30 }
  validates :name,        presence: true, length: { maximum: 50 }
end
