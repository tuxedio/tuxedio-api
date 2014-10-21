FactoryGirl.define do
  factory :experience do
    name        { Faker::Name.name }
    location    { Faker::Address.city }
    description { Faker::Lorem.paragraph }

    trait :hosted do
      after :create do |experience|
        experience.host = create :person
      end
    end

    factory :hosted_experience, traits: [:hosted]
  end
end
