class CatsDealers
  DEALERS = [CatsUnlimited, HappyCats].freeze

  class << self
    def find_offers(search_params)
      return [] if search_params.empty?

      all_offers.select do |offer|
        search_params.all? do |param, value|
          next true if value.empty?

          offer[param] == value
        end
      end
    end

    def all_offers
      DEALERS.each_with_object([]) do |dealer, array|
        array.concat(dealer.new.offers)
      end
    end
  end
end
