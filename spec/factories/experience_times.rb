FactoryGirl.define do
  factory :experience_time do
    starts_at { DateTime.now + 2.weeks }
    ends_at { DateTime.now + 2.weeks + 1.hour }
  end
end
