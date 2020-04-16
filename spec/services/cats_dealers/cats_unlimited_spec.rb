require 'rails_helper'

describe CatsDealers::CatsUnlimited do
  let(:cats_unlimited_service) { described_class.new }

  describe '#offers' do
    let(:expected_offers) do
      [
        {type: 'Abyssin', location: 'Lviv', price: 500, image: 'https://cat1.jpg'},
        {type: 'Abyssin', location: 'Lviv', price: '550', image: 'https://cat2.jpg'}
      ]
    end

    it 'fetches, parses and maps offers' do
      VCR.use_cassette('cats_unlimited_valid') do
        expect(cats_unlimited_service.offers).to eq(expected_offers)
      end
    end

    context 'when request has failed' do
      it 'returns empty array' do
        VCR.use_cassette('cats_unlimited_failed') do
          expect(cats_unlimited_service.offers).to eq([])
        end
      end
    end

    context 'when response has invalid format' do
      it 'returns empty array' do
        VCR.use_cassette('cats_unlimited_invalid') do
          expect(cats_unlimited_service.offers).to eq([])
        end
      end
    end
  end
end
