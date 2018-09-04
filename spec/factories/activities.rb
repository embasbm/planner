FactoryBot.define do
  factory :activity do
    name {'Foo' }
    hours_spent { 1.2 }
    category { 'Bar' }
    location { 'Baz' }
    district { 'Xyz' }

    trait :all_day do
      opening_days {[FactoryBot.build(:opening_day, :all_day)]}
    end

    trait :morning do
      opening_days {[FactoryBot.build(:opening_day, :morning)]}
    end

    trait :afternoon do
      opening_days {[FactoryBot.build(:opening_day, :afternoon)]}
    end
  end
end
