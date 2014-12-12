require 'address_parser/autocorrector'

describe AddressParser::Autocorrector do

  let(:service) { AddressParser::Autocorrector }

  it 'бульва -> бульвар' do
    invalid_address = 'Жулебинский бульва д2 к2'
    expect(service.new(invalid_address).run).to eq 'Жулебинский бульвар д2 к2'
  end

  it 'clear улица|ул|жк' do
    invalid_address = 'улица проспект Андропова 37 корпус 4'
    expect(service.new(invalid_address).run).to eq 'проспект Андропова 37 корпус 4'
  end

  it 'city' do
    address = 'Шверника 17'
    params  = {city: 'Москва'}
    expect(service.new(address, params).run).to eq 'Москва Шверника 17'
  end

  # describe 'trimming' do

  #   describe 'подъезд' do
  #     it 'after number' do
  #       invalid_address = 'Скаковая улица, дом 4 стр 2. подъезд 5'
  #       expect(autocorrector.new(invalid_address).run).to be 'Скаковая улица, дом 4 стр 2'
  #     end

  #     it 'before number' do
  #       invalid_address = 'Скаковая улица, дом 4 стр 2. 5 подъезд'
  #       expect(autocorrector.new(invalid_address).run).to be 'Скаковая улица, дом 4 стр 2'
  #     end
  #   end

  #   describe 'код' do
  #     it 'after number' do
  #       invalid_address = 'Скаковая улица, дом 4 стр 2. код 5555'
  #       expect(autocorrector.new(invalid_address).run).to be 'Скаковая улица, дом 4 стр 2'
  #     end

  #     it 'before number' do
  #       invalid_address = 'Скаковая улица, дом 4 стр 2. 111 домофон'
  #       expect(autocorrector.new(invalid_address).run).to be 'Скаковая улица, дом 4 стр 2'
  #     end
  #   end

  # end

end