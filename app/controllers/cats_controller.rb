class CatsController < ApplicationController
  before_action :set_search_params, only: [:search]

  def search
    @cats = CatsDealers.new.find_offers(@search_params).sort_by { |offer| offer[:price].to_i }

    @best_offer = @cats.first
  end

  private

  def set_search_params
    @search_params = params.permit(:type, :location).to_h.symbolize_keys
  end
end
