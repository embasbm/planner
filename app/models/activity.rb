class Activity
  include Mongoid::Document
  field :name, type: String
  field :hours_spent, type: Float
  field :category, type: String
  field :location, type: String
  field :district, type: String

  embeds_many :opening_days
  embeds_one :position

  embedded_in :city
end
