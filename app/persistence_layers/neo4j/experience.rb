module PersistenceLayers
  module Neo4j
    class Experience
      include ::Neo4j::ActiveNode

      property :id
      property :name
      property :location
      property :description
    end
  end
end
