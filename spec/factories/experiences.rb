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

    trait :times do
      after :create do |experience|
        experience.times << create_list(:experience_time, 4)
      end
    end

    factory :hosted_experience, traits: [:hosted]
    factory :experience_with_times, traits: [:times]
  end
end
