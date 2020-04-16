require 'spec_helper'

describe CatsHelper do
  describe '#rescue_broken_image_tag' do
    let(:expected_attribute) do
      'onerror="this.src=&#39;/assets/no-image-bfc0927a8b7a2856de2a57b7824c08723fa60'\
      'f988289df4f25f766779482f19d.svg&#39;"'
    end

    it 'returns img tag with default image link onerror' do
      expect(helper.rescue_broken_image_tag('http://1.jpg')).to include(expected_attribute)
    end
  end

  describe '#search_results_title' do
    context 'when no search params present' do
      let(:search_params) { {type: '', location: ''} }

      it 'returns general title' do
        expect(helper.search_results_title(search_params)).to eq('All cats from Everywhere')
      end
    end

    context 'when type param present' do
      let(:search_params) { {type: 'Bobtail', location: ''} }

      it 'returns title with specific type and general location' do
        expect(helper.search_results_title(search_params)).to eq('Bobtail cats from Everywhere')
      end
    end

    context 'when location param present' do
      let(:search_params) { {type: '', location: 'Lviv'} }

      it 'returns title with specific location and general type' do
        expect(helper.search_results_title(search_params)).to eq('All cats from Lviv')
      end
    end

    context 'when both params present' do
      let(:search_params) { {type: 'Bobtail', location: 'Lviv'} }

      it 'returns title with both params' do
        expect(helper.search_results_title(search_params)).to eq('Bobtail cats from Lviv')
      end
    end
  end
end
