require 'address_parser/to_hash'
require 'address_parser/autocorrector'

module AddressParser

  def self.address_to_hash address, params={}
    Parser.new(address, params).to_hash
  end

  private

    class Parser

      def initialize address, params={}
        @address = address
        @params  = params
      end

      def address
        AddressParser::Autocorrector.new(@address, @params).run
      end

      def to_hash
        AddressParser::ToHash.new(address, @params).run
      end

    end

end