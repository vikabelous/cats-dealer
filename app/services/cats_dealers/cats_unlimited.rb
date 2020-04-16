class CatsDealers
  class CatsUnlimited < Base
    RESOURCE_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json'.freeze

    FIELDS_MAP = {
      type: 'name',
      location: 'location',
      price: 'price',
      image: 'image'
    }.freeze

    def initialize
      @parser = Parsers::JSONParser.new
    end

    def map
      proc do |parsed_data|
        parsed_data.map { |item| map_hash(item, FIELDS_MAP) }
      end
    end
  end
end
