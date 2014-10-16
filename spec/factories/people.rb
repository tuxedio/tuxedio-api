FactoryGirl.define do
  factory :person do
    bio      { Faker::Lorem.sentence }
    gender   { %w(male female).sample }
    hometown { Faker::Address.city }
    website  { Faker::Internet.url }
    location { Faker::Address.city }
    name     { Faker::Name.name }
  end
end
