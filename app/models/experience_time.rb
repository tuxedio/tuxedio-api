class ExperienceTime
  include Neo4j::ActiveNode

  has_one :in, :experience, model_class: Experience

  property :starts_at, type: DateTime
  property :ends_at, type: DateTime

  validates_datetime :starts_at, after: DateTime.now
  validates_datetime :ends_at, after: :starts_at
end
