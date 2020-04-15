require 'rest-client'

class CatsDealers
  class Base
    class << self
      def offers
        fetch.then(&parse).then(&map)
      rescue RestClient::ExceptionWithResponse => e
        # TODO: handle exception
        e
      end

      def fetch
        RestClient.get(self::RESOURCE_URL).body
      end
    end
  end
end
