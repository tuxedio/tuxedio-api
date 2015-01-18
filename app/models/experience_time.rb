class ExperienceTime < PersistenceLayers::Neo4j::ExperienceTime
  has_one :in, :experience, model_class: Experience

  validates_datetime :starts_at, after: DateTime.now
  validates_datetime :ends_at, after: :starts_at
end
