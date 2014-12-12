require 'address_parser/to_hash'

describe AddressParser::ToHash do

  describe '.street_number_to_hash' do

    let(:service) { AddressParser::ToHash.new('test') }

    it '26' do
      address = '26'
      hash = { number: '26' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '5/9 ст5' do
      address = '5/9 ст5'
      hash = { number: '5/9', building: '5' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '1/28' do
      address = '1/28'
      hash = { number: '1/28' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '17к3с1' do
      address = '17к3с1'
      hash = { number: '17', housing: '3', building: '1' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '18-20' do
      address = '18-20'
      hash = { number: '18-20' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '10Б' do
      address = '18-20'
      hash = { number: '18-20' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '5а' do
      address = '5а'
      hash = { number: '5а' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '4/22кБ' do
      address = '4/22кБ'
      hash = { number: '4/22', housing: 'Б' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '26кБс1' do
      address = '26кБс1'
      hash = { number: '26', housing: 'Б', building: '1' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '26сЖ' do
      address = '26сЖ'
      hash = { number: '26', building: 'Ж' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it '6 корпус 1' do
      address = '6 корпус 1'
      hash = { number: '6', housing: '1' }
      expect(service.street_number_to_hash address).to eq hash
    end

    it 'квартал 113А корпус 8' do
      short_name = "к8"
      hash = { housing: '8' }
      expect(service.street_number_to_hash short_name).to eq hash
    end

  end
end