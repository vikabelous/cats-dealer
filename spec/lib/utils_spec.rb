require 'rails_helper'

class TestClass
  include Utils
end

describe Utils do
  describe '#map_hash' do
    let(:initial_hash) { {givenName: 'Vika', surname: 'Bilous'} }
    let(:fields_map) { {first_name: :givenName, last_name: :surname} }
    let(:expected_hash) { {first_name: 'Vika', last_name: 'Bilous'} }

    it 'maps initial hash fields accroding to fields map' do
      test_object = TestClass.new
      expect(test_object.map_hash(initial_hash, fields_map)).to eq(expected_hash)
    end
  end
end
