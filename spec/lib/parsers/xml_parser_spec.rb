require 'rails_helper'

describe Parsers::XMLParser do
  let(:parser) { described_class.new }

  describe '#run' do
    context 'when xml is valid' do
      let(:valid_xml) do
        <<-XML
          <?xml version="1.0" encoding="UTF-8"?>
          <cats>
            <cat>
              <title>Bengal</title>
              <cost>800</cost>
              <location>Kyiv</location>
              <img>https://cat4.jpg</img>
            </cat>
          </cats>
        XML
      end

      let(:expected_output) do
        {
          'cats' => {
            'cat' => {
              'title' => 'Bengal',
              'cost' => '800',
              'location' => 'Kyiv',
              'img' => 'https://cat4.jpg'
            }
          }
        }
      end

      it 'converts xml to hash' do
        expect(parser.run(valid_xml)).to eq(expected_output)
      end
    end

    context 'when xml is not valid' do
      let(:invalid_xml) { 'lalala' }

      it 'raises ParserError' do
        expect { parser.run(invalid_xml) }.to raise_error(Errors::ParserError)
      end
    end
  end
end
