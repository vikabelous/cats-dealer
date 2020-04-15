class CatsController < ApplicationController
  def search
    return @cats = [] unless search_params?

    @cats = CatsDealers.new.find_offers(params[:type], params[:location])
  end

  private

  def search_params?
    params[:type].present? && params[:location].present?
  end
end
