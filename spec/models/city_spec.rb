require 'rails_helper'

RSpec.describe City, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:name).of_type(String) }

  it { is_expected.to embed_many(:activities) }

  describe '#fetch_activities' do
    let!(:city) { create(:city) }
    context 'when no filter present' do
      it 'returns all activities' do
        expect(city.fetch_activities.count).to eq 2
      end
    end

    context 'when category filter' do
      it 'reaturn only that category activities' do
        expect(city.fetch_activities('shopping').count).to eq 1
        expect(city.fetch_activities('shopping').first[:properties][:name]).to eq 'El Rastro'
      end
    end

    context 'when location filter' do
      it 'reaturn only that location activities' do
        expect(city.fetch_activities('shopping').count).to eq 1
        expect(city.fetch_activities(nil,'outdoors').first[:properties][:name]).to eq 'Palacio Real'
      end
    end

    context 'when district filter' do
      it 'reaturn only that district activities' do
        expect(city.fetch_activities('shopping').count).to eq 1
        expect(city.fetch_activities(nil, nil, 'Centro').first[:properties][:name]).to eq 'El Rastro'
      end
    end

    context 'when multiple filters' do
      it 'reaturn only that common activities for those filters' do
        expect(city.fetch_activities('shopping').count).to eq 1
        expect(city.fetch_activities('shopping', nil, 'Centro').first[:properties][:name]).to eq 'El Rastro'
      end
    end
  end

  describe '#recommend_activities' do
    let!(:city) { create(:city) }

    describe 'receive a time range' do
      it 'reaturn only activities for that time range' do
        expect(city.recommend_activities({ range: '10:00-12:00' }).count).to eq 1
        expect(city.recommend_activities({ range: '10:00-12:00' })[0][:properties][:name]).to eq 'El Rastro'
        expect(city.recommend_activities({ range: '17:00-18:00' }).count).to eq 1
        expect(city.recommend_activities({ range: '17:00-18:00' })[0][:properties][:name]).to eq 'Palacio Real'
      end
    end

    describe 'receive category' do
      it 'reaturn only activities for that category' do
        expect(city.recommend_activities({ category: 'cultural' }).count).to eq 1
        expect(city.recommend_activities({ category: 'cultural' })[0][:properties][:name]).to eq 'Palacio Real'

        expect(city.recommend_activities({ category: 'shopping' }).count).to eq 1
        expect(city.recommend_activities({ category: 'shopping' })[0][:properties][:name]).to eq 'El Rastro'
      end
    end

    describe 'receive time range and category' do
      it 'reaturn only common activities' do
        expect(city.recommend_activities({ range: '10:00-12:00', category: 'cultural' }).count).to eq 0
        expect(city.recommend_activities({ range: '10:00-12:00', category: 'shopping' }).count).to eq 1
      end
    end
  end
end
