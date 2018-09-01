require 'rails_helper'

RSpec.describe Position, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:latitude).of_type(BigDecimal) }
  it { is_expected.to have_field(:longitud).of_type(BigDecimal) }

  it { is_expected.to be_embedded_in(:activity) }
end
