class Position
  include Mongoid::Document
  field :latitude, type: BigDecimal
  field :longitud, type: BigDecimal

  embedded_in :activity
end
