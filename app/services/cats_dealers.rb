class CatsDealers
  DEALERS = [CatsUnlimited, HappyCats].freeze

  def find_offers(type, location)
    all_offers.select do |offer|
      offer[:type] == type && offer[:location] == location
    end
  end

  def all_offers
    DEALERS.each_with_object([]) do |dealer, array|
      array.concat(dealer.offers)
    end
  end
end
