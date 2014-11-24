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

  factory :login_creds, class: Hash do
    user {{
      email: Faker::Internet.email,
      password: Faker::Internet.password
    }}

    initialize_with { attributes }
  end

  factory :user_registration, class: Hash do
    user {{
      username: 'Jon Snow',
      email: 'game@thrones.com',
      password: 'You know nothing, Jon Snow',
      password_confirmation: 'You know nothing, Jon Snow'
    }}

    initialize_with { attributes }
  end
end
