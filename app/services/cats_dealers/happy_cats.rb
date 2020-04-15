class CatsDealers
  class HappyCats < Base
    extend Utils

    RESOURCE_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml'.freeze

    FIELDS_MAP = {
      type: 'title',
      location: 'location',
      price: 'cost',
      image: 'img'
    }.freeze

    class << self
      def parse
        proc do |raw_data|
          Hash.from_xml(raw_data)
        end
      end

      def map
        proc do |parsed_data|
          parsed_data['cats']['cat'].map { |item| hash_mapper(item, FIELDS_MAP) }
        end
      end
    end
  end
end
