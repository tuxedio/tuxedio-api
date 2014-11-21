FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    sequence(:email) { |n| "#{Faker::Internet.email}#{n}" }
    password { Faker::Internet.password }
    authentication_token { Faker::Lorem.characters 10 }

    trait :with_role do
      after :create do |user|
        user.role = create :person
      end
    end

    factory :user_with_role, traits: [:with_role]
  end

  factory :login_creds, class: Hash do
    user {{
      email: Faker::Internet.email,
      password: Faker::Internet.password
    }}

    initialize_with { attributes }
  end
end
