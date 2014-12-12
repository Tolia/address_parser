require 'geocoder'

module AddressParser
  class ToHash

    def initialize address, params
      @address = address
      @params  = params
    end

    def run
      to_hash
    end

    def street_number_to_hash street_number
      matcher = street_number.match /^((?:[0-9]|-|\/)*(?:[a-жА-Ж])?)(?:\s)?([а-я]+(?:\s)?(?:[0-9]|[А-Я])*){,1}(?:\s)?([а-я]+(?:\s)?[0-9]*){,1}$/
      matcher ? parse_street_number(matcher) : {}
    end

    private

      def geocoder
        Geocoder.search(@address, params: @params).first
      end

      def respond_components
        %w(street_number route)
      end

      def to_hash
        geo = geocoder
        if geo
          hash = geo.geometry ? geo.geometry["location"] : {}
          geo.address_components.each do |component|
            type = component["types"].first
            if respond_components.include? type
              hash.merge! send("#{type}_to_hash", component["short_name"])
            end
          end
          hash
        end 
      end

      def route_to_hash address
        { address: address }
      end

      def parse_street_number matcher
        hash = matcher[1].length == 0 ? {} : { number: matcher[1] }
        (2..3).each do |i|
          if matcher && !matcher[i].nil?
            if matcher[i].match /к/
              hash[:housing] = matcher[i].match(/([0-9]|[А-Я])+/).to_s
            elsif matcher[i].match /с/
              hash[:building] = matcher[i].match(/([0-9]|[А-Я])+/).to_s
            end
          end
        end
        hash
      end

  end

end