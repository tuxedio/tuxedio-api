FactoryGirl.define do
  factory :person do
    bio      { Faker::Lorem.sentence }
    gender   { %w(male female).sample }
    hometown { Faker::Address.city }
    website  { Faker::Internet.url }
    location { Faker::Address.city }
    name     { Faker::Name.name }

    trait :with_hosted_experiences do
      after :create do |person|
        person.hosted_experiences << create_list(:experience, 4)
      end
    end

    factory :person_with_hosted_experiences,
      traits: [:with_hosted_experiences]
  end
end
