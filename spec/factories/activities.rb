FactoryBot.define do
  factory :activity do
    name 'Foo'
    hours_spent 1.2
    category 'Bar'
    location 'Baz'
    district 'Xyz'
    opening_days { [ FactoryBot.build(:opening_day), FactoryBot.build(:opening_day )] }
  end
end
