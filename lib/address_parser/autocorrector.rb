module AddressParser
  class Autocorrector

    def initialize address, params={}
      @address = address.dup
      @params  = params
    end

    def run
      autocorrector!
      address = @address
      address = "#{ @params[:city] } #{ @address }" unless @params[:city].nil?
      address
    end

    private

      def expressions
        {
          /(ул|жк|улица)\.?\s/ => '',
          /(буль([а-я]*))/     => 'бульвар',
          /(М|м)осква/         => ''
        }
      end

      def autocorrector!
        expressions.each do |regexp, val|
          @address.gsub! regexp, val
        end
      end

  end
end