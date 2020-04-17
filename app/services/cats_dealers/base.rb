require 'rest-client'

class CatsDealers
  class Base
    include Utils

    def offers
      fetch.then(&parse).then(&map)
    rescue RestClient::ExceptionWithResponse, Errors::ParserError => e
      Rails.logger.error "[#{self.class.name}] - #{e.message}"
      []
    end

    private

    def fetch
      RestClient.get(self.class::RESOURCE_URL).body
    end

    def parse
      proc do |raw_data|
        parser.run(raw_data)
      end
    end

    def map
      raise 'map should be defined in child class'
    end

    def parser
      raise 'parser should be defined in child class'
    end
  end
end
