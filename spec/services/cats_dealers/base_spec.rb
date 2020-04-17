require 'rails_helper'

class TestDealer1 < CatsDealers::Base
  RESOURCE_URL = 'https://example.com'.freeze
end

class TestDealer2 < CatsDealers::Base
  RESOURCE_URL = 'https://example.com'.freeze

  def parse; end
end

describe CatsDealers::Base do
  describe '#offers' do
    context 'when parser is nor defined' do
      let(:test_dealer) { TestDealer1.new }

      it 'raises error' do
        VCR.use_cassette('dummy_resource') do
          expect { test_dealer.offers }.to raise_error('parser should be defined in child class')
        end
      end
    end

    context 'when map is nor defined' do
      let(:test_dealer) { TestDealer2.new }

      it 'raises error' do
        VCR.use_cassette('dummy_resource') do
          expect { test_dealer.offers }.to raise_error('map should be defined in child class')
        end
      end
    end
  end
end
