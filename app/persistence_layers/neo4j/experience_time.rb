module PersistenceLayers
  module Neo4j
    class ExperienceTime
      include ::Neo4j::ActiveNode

      property :starts_at, type: DateTime
      property :ends_at, type: DateTime
    end
  end
end
