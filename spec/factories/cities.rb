FactoryBot.define do
  factory :city do
    name 'Foo'
    activities {[FactoryBot.build(:activity, name: 'Foo 1'), FactoryBot.build(:activity, name: 'Foo 2')]}
  end
end
