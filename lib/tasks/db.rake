namespace :db do
  task :clean do
    Neo4j::Session.current._query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
  end

  task :seed do
    FactoryGirl.create :user,
      email: 'example@example.com',
      password: 'foobar124'

    FactoryGirl.create_list :experience, 100
  end
end
