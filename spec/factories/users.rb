FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    sequence(:email) { |n| "#{Faker::Internet.email}#{n}" }
    password { Faker::Internet.password }
  end
end
