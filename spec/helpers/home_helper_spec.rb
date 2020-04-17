require 'rails_helper'

describe HomeHelper do
  describe '#cats_types_select_tag' do
    it 'has option with empty value' do
      expect(helper.cats_types_select_tag).to include('<option value="">I don&#39;t care</option>')
    end
  end

  describe '#locations_select_tag' do
    it 'has option with empty value' do
      expect(helper.locations_select_tag).to include('<option value="">I don&#39;t care</option>')
    end
  end
end
