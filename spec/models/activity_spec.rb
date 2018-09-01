require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:hours_spent).of_type(Float) }
  it { is_expected.to have_field(:category).of_type(String) }
  it { is_expected.to have_field(:location).of_type(String) }
  it { is_expected.to have_field(:district).of_type(String) }

  it { is_expected.to embed_many(:opening_days) }
  it { is_expected.to embed_one(:position) }
end
