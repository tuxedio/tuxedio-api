namespace :db do
  task :clean do
    require 'neo4j-core'
    Neo4j::Session.open :server_db

    Neo4j::Session.current._query(
      'MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r'
    )
  end

  task :seed do
    require File.join(Rails.root, 'config', 'environment')

    FactoryGirl.create(
      :user,
      email: 'example@example.com',
      password: 'foobar123'
    )

    FactoryGirl.create_list :experience, 100
  end
end
