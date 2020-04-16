class CatsDealers
  DEALERS = [CatsUnlimited, HappyCats].freeze

  class << self
    def find_offers(search_params)
      all_offers.select do |offer|
        offer[:type] == search_params[:type] &&
          offer[:location] == search_params[:location]
      end
    end

    def all_offers
      DEALERS.each_with_object([]) do |dealer, array|
        array.concat(dealer.new.offers)
      end
    end
  end
end
