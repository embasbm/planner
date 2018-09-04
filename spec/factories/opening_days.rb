FactoryBot.define do
  factory :opening_day do
    name { 'Bar' }
    opens_at { '09:00' }
    closes_at { '18:00' }

    trait :all_day do
      opens_at { '09:00' }
      closes_at { '22:00' }
    end

    trait :morning do
      name { 'Morning' }
      opens_at { '09:00' }
      closes_at { '13:00' }
    end

    trait :afternoon do
      name { 'Afternoon' }
      opens_at { '14:00' }
      closes_at { '22:00' }
    end
  end
end
