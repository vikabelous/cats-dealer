module Parsers
  class JSONParser
    def run(raw_data)
      JSON.parse(raw_data)
    rescue JSON::ParserError => e
      raise Errors::ParserError, e.message
    end
  end
end
