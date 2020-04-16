require 'rails_helper'

describe CatsController do
  describe 'GET #search' do
    before { get 'search' }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end
end
