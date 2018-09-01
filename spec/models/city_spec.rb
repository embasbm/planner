require 'rails_helper'

RSpec.describe City, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:name).of_type(String) }

  it { is_expected.to embed_many(:activities) }
end
