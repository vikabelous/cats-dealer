require 'rails_helper'

describe CatsDealers::HappyCats do
  let(:happy_cats_service) { described_class.new }

  describe '#offers' do
    let(:expected_offers) do
      [
        {type: 'American Curl', location: 'Odessa', price: '650', image: 'https://cat1.jpg'},
        {type: 'Bengal', location: 'Odessa', price: '800', image: 'https://cat2.jpg'}
      ]
    end

    it 'fetches, parses and maps offers' do
      VCR.use_cassette('happy_cats_valid') do
        expect(happy_cats_service.offers).to eq(expected_offers)
      end
    end

    context 'when request has failed' do
      it 'returns empty array' do
        VCR.use_cassette('happy_cats_failed') do
          expect(happy_cats_service.offers).to eq([])
        end
      end
    end

    context 'when response has invalid format' do
      it 'returns empty array' do
        VCR.use_cassette('happy_cats_invalid') do
          expect(happy_cats_service.offers).to eq([])
        end
      end
    end
  end
end
