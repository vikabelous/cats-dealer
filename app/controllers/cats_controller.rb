class CatsController < ApplicationController
  def search
    @search_params = params.permit(:type, :location).to_h.symbolize_keys

    @cats = CatsDealers.find_offers(@search_params)

    @best_offer = @cats.min_by { |offer| offer[:price].to_i }
  end
end
