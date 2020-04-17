module Parsers
  class XMLParser
    def run(raw_data)
      Hash.from_xml(raw_data)
    rescue REXML::ParseException => e
      raise Errors::ParserError, e.message
    end
  end
end
