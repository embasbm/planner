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

  scope :by_category, lambda { |category_filter| where(category: /.*#{category_filter}*./) }
  scope :by_location, lambda { |location_filter| where(location: /.*#{location_filter}*./) }
  scope :by_district, lambda { |district_filter| where(district: /.*#{district_filter}.*/) }
end
