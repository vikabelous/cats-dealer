require 'rails_helper'

describe ApplicationController do
  describe '#render_header?' do
    it 'returns true' do
      expect(controller.render_header?).to be true
    end
  end
end
