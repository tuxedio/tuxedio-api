FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    sequence(:email) { |n| "#{Faker::Internet.email}#{n}" }
    password { Faker::Internet.password }

    trait :with_role do
      after :create do |user|
        user.role = create :person
      end
    end

    factory :user_with_role, traits: [:with_role]
  end
end
