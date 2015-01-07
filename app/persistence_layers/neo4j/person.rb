module PersistenceLayers
  module Neo4j
    class Person
      include ::Neo4j::ActiveNode

      property :bio
      property :gender
      property :website
      property :hometown
      property :location
      property :name, index: :exact
    end
  end
end
