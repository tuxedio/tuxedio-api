namespace :deploy do
  namespace :clean do
    desc 'Clean container'
    task :app do
      puts 'Cleaning old app containers...'
      `docker rm -f tux`
    end

    task :db do
      puts 'Cleaning old DB containers...'
      system 'docker rm -f tux-db'
    end
  end

  desc 'Build container for deployment'
  task :build do
    puts 'Building Docker image...'
    system 'docker build -t tuxedio .'
  end

  desc 'Run container'
  task qa: [:db, :app] do
    puts 'Deployed app for QA.'
  end


  desc 'Shell into container'
  task :shell do
    puts 'Running bash inside of container...'
    system 'docker run -it --link tux-db:tux-db -p 5000:5000 tuxedio bash'
  end

  desc 'Boot the app'
  task :app do
    Rake::Task['deploy:clean:app'].execute
    puts 'Booting app...'
    system 'docker run -it -d --link tux-db:tux-db -p 5000:5000 --name tux tuxedio'
  end

  desc 'Boot the DB'
  task :db do
    Rake::Task['deploy:clean:db'].execute
    puts 'Booting DB...'
    system 'docker run -it -d --privileged -p 7474:7474 --name tux-db tpires/neo4j'
    sleep 2
  end
end
