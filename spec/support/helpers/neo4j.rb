def delete_db
    Neo4j::Session.current._query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
end
