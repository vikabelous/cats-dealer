class CatsDealers
  class CatsUnlimited < Base
    extend Utils

    RESOURCE_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json'.freeze

    FIELDS_MAP = {
      type: 'name',
      location: 'location',
      price: 'price',
      image: 'image'
    }.freeze

    class << self
      def parse
        proc do |raw_data|
          JSON.parse(raw_data)
        end
      end

      def map
        proc do |parsed_data|
          parsed_data.map { |item| map_hash(item, FIELDS_MAP) }
        end
      end
    end
  end
end
