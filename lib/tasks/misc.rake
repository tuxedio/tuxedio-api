namespace :misc do
  task :curl do
    %x(curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" --data '{"user": {"email": "example@example.com", "password": "foobar123"}}' http://localhost:3000/login)
  end
end
