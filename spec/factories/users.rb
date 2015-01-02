FactoryGirl.define do
  factory :user do
    handle { Faker::Internet.user_name 3..20 }
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
    user do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }
    end

    initialize_with { attributes }
  end

  factory :user_registration, class: Hash do
    user do
      {
        handle: 'Jon Snow',
        email: 'game@thrones.com',
        password: 'You know nothing, Jon Snow',
        password_confirmation: 'You know nothing, Jon Snow'
      }
    end

    initialize_with { attributes }
  end
end
