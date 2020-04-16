class CatsDealers
  class HappyCats < Base
    RESOURCE_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml'.freeze

    FIELDS_MAP = {
      type: 'title',
      location: 'location',
      price: 'cost',
      image: 'img'
    }.freeze

    def initialize
      @parser = Parsers::XMLParser.new
    end

    def map
      proc do |parsed_data|
        parsed_data['cats']['cat'].map { |item| map_hash(item, FIELDS_MAP) }
      end
    end
  end
end
