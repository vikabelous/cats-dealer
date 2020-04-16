require 'rails_helper'

describe CatsDealers do
  describe '.find_offers' do
    context 'when search params present' do
      let(:search_params) { {type: 'Abyssin', location: 'Lviv'} }

      let(:expected_results) do
        [
          {type: 'Abyssin', location: 'Lviv', price: 500, image: 'https://cat1.jpg'},
          {type: 'Abyssin', location: 'Lviv', price: '550', image: 'https://cat2.jpg'}
        ]
      end

      it 'filters offeres by type and location' do
        VCR.use_cassette('cats_dealers') do
          expect(described_class.find_offers(search_params)).to eq(expected_results)
        end
      end

      context 'when there are no offers matching the search params' do
        let(:search_params) { {type: 'Abyssin', location: 'Odessa'} }

        it 'returns empty array' do
          VCR.use_cassette('cats_dealers') do
            expect(described_class.find_offers(search_params)).to eq([])
          end
        end
      end

      context 'when one searhc param is specified' do
        let(:search_params) { {type: 'Abyssin', location: ''} }
        let(:expected_results) do
          [
            {type: 'Abyssin', location: 'Lviv', price: 500, image: 'https://cat1.jpg'},
            {type: 'Abyssin', location: 'Lviv', price: '550', image: 'https://cat2.jpg'}
          ]
        end

        it 'returns all offers matching this param' do
          VCR.use_cassette('cats_dealers') do
            expect(described_class.find_offers(search_params)).to eq(expected_results)
          end
        end
      end
    end

    context 'when search params are missing' do
      let(:search_params) { {} }

      it 'returns empty array' do
        VCR.use_cassette('cats_dealers') do
          expect(described_class.find_offers(search_params)).to eq([])
        end
      end
    end
  end

  describe '.all_offers' do
    let(:expected_results) do
      [
        {type: 'Abyssin', location: 'Lviv', price: 500, image: 'https://cat1.jpg'},
        {type: 'Abyssin', location: 'Lviv', price: '550', image: 'https://cat2.jpg'},
        {type: 'American Curl', location: 'Odessa', price: 450, image: 'https://cat3.jpg'},
        {type: 'Bengal', location: 'Kyiv', price: '800', image: 'https://cat4.jpg'},
        {type: 'Bengal', location: 'Kyiv', price: '600', image: 'https://cat5.jpg'}
      ]
    end

    it 'gets offers from all dealers' do
      VCR.use_cassette('cats_dealers') do
        expect(described_class.all_offers).to eq(expected_results)
      end
    end
  end
end
