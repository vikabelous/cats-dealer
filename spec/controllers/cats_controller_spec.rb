require 'rails_helper'

describe CatsController do
  describe 'GET #search' do
    let(:cats) do
      [
        {type: 'cat_1', location: 'lviv', price: 30},
        {type: 'cat_2', location: 'kyiv', price: 10},
        {type: 'cat_3', location: 'odesa', price: 40}
      ]
    end

    let(:best_offer) { {type: 'cat_2', location: 'kyiv', price: 10} }

    before do
      allow(CatsDealers).to receive(:find_offers).and_return(cats)
    end

    context 'when search params present' do
      let(:search_params) { {type: 'some cat', location: 'lviv'} }

      it 'assigns search params' do
        get :search, params: search_params

        expect(assigns(:search_params)).to eq(search_params)
      end
    end

    context 'when search params are missing' do
      it 'sets search_params to empty hash' do
        get :search

        expect(assigns(:search_params)).to eq({})
      end
    end

    context 'when cats offers were found' do
      let(:expected_cats) do
        [
          {type: 'cat_2', location: 'kyiv', price: 10},
          {type: 'cat_1', location: 'lviv', price: 30},
          {type: 'cat_3', location: 'odesa', price: 40}
        ]
      end

      it 'sort ofers by price and assigns to @cats' do
        get :search

        expect(assigns(:cats)).to eq(expected_cats)
      end

      it 'assigns @best_offer' do
        get :search

        expect(assigns(:best_offer)).to eq(best_offer)
      end
    end

    context 'when no offers were found' do
      let(:cats) { [] }

      it 'assigns cats to empty array' do
        get :search

        expect(assigns(:cats)).to eq([])
      end

      it 'assigns best offer to nil' do
        get :search

        expect(assigns(:best_offer)).to be_nil
      end
    end
  end
end
