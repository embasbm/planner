class City
  include Mongoid::Document
  field :name, type: String

  embeds_many :activities
end
