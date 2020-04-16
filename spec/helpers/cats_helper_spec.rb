require 'spec_helper'

describe CatsHelper do
  describe '#rescue_broken_image_tag' do
    let(:expected_attribute) do
      'onerror="this.src=&#39;/assets/default_cat-dde2bc0048418308cf177f90c5a2dffb64d3f6978' \
      'f5d11a9e8d4efad4ea4476b.png&#39;"'
    end

    it 'returns img tag with default image link onerror' do
      expect(helper.rescue_broken_image_tag('http://1.jpg')).to include(expected_attribute)
    end
  end
end
