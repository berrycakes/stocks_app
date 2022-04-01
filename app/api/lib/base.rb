require 'httparty'

module Api
    class Base
        attr_accessor :options

        def initialize(options)
            @options = options
        end


        def request(type, url, opts = {})
            HTTParty.send(type, url, opts).yield_self do |response|
                parsed_response(response)
            end
        end

        def parsed_response(response)
            "#{__method__}"
        end
    end
end