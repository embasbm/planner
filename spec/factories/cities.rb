FactoryBot.define do
  factory :city do
    name { 'Foo' }
    activities {
      [
        FactoryBot.build(:activity, :morning, name: 'El Rastro', category: 'shopping', location: 'indoor', district: 'Centro'),
        FactoryBot.build(:activity, :afternoon, name: 'Palacio Real', category: 'cultural', location: 'outdoors', district: 'Chamberi')
      ]
    }
  end
end
