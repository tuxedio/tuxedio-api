class Experience < PersistenceLayers::Neo4j::Experience
  validates :name,        presence: true, length: { maximum: 50 }
  validates :location,    presence: true, length: { maximum: 30 }
end
