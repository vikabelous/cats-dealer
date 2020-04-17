class CatsDealers
  DEALERS = [CatsUnlimited, HappyCats].freeze

  def find_offers(search_params)
    all_offers.select do |offer|
      search_params.all? do |param, value|
        next true if value.empty?

        offer[param] == value
      end
    end
  end

  def all_offers
    DEALERS.each_with_object([]) do |dealer, offers|
      offers.concat(dealer.new.offers)
    end
  end
end
