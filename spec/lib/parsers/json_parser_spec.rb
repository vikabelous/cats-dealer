require 'rails_helper'

describe Parsers::JSONParser do
  let(:parser) { described_class.new }

  describe '#run' do
    context 'when json is valid' do
      let(:valid_json) do
        <<-JSON
          {"name":"Abyssin","price":500,"location":"Lviv","image":"https://cat1.jpg"}
        JSON
      end

      let(:expected_output) do
        {
          'name' => 'Abyssin',
          'price' => 500,
          'location' => 'Lviv',
          'image' => 'https://cat1.jpg'
        }
      end

      it 'converts json' do
        expect(parser.run(valid_json)).to eq(expected_output)
      end
    end

    context 'when json is not valid' do
      let(:invalid_json) { '' }

      it 'raises ParserError' do
        expect { parser.run(invalid_json) }.to raise_error(Errors::ParserError)
      end
    end
  end
end
