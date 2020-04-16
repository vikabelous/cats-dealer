require 'rails_helper'

describe HomeController do
  describe '#render_header?' do
    it 'returns false' do
      expect(controller.render_header?).to be false
    end
  end
end
