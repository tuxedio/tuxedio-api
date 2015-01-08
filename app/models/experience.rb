class Experience < PersistenceLayers::Neo4j::Experience
  has_one :in, :host, model_class: false
  has_many :out, :times, model_class: ExperienceTime

  validates :name,        presence: true, length: { maximum: 50 }
  validates :location,    presence: true, length: { maximum: 30 }
end
