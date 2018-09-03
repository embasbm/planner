FactoryBot.define do
  factory :city do
    name { 'Foo' }
    activities {
      [
        {
          "name": "El Rastro",
          "hours_spent": 2.5,
          "category": "shopping",
          "location": "indoor",
          "district": "Centro"
        },
        {
          "name": "Palacio Real",
          "hours_spent": 1.5,
          "category": "cultural",
          "location": "outdoors",
          "district": "Chamberí"
        }
      ]
    }
  end
end
