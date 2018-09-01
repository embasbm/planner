require 'rails_helper'

RSpec.describe OpeningDay, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:opens_at).of_type(String) }
  it { is_expected.to have_field(:closes_at).of_type(String) }

  it { is_expected.to be_embedded_in(:activity) }
end
