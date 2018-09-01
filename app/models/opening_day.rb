class OpeningDay
  include Mongoid::Document
  field :name, type: String
  field :opens_at, type: String
  field :closes_at, type: String

  embedded_in :activity
end
