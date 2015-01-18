module PersistenceLayers
  module Neo4j
    class Experience
      include ::Neo4j::ActiveNode

      has_one :in, :host, model_class: false
      has_many :out, :times, model_class: ExperienceTime

      property :id
      property :name
      property :location
      property :description
    end
  end
end
