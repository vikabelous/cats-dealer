class CatsController < ApplicationController
  def search
    @search_params = {
      type: params[:type],
      location: params[:location]
    }

    @cats = CatsDealers.find_offers(@search_params)

    @best_offer = @cats.min_by { |offer| offer[:price].to_i }
  end
end
