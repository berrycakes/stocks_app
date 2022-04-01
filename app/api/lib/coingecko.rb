module Api
    class Coinbase < Base
        def request
            super(:get, url)
        end

        def parsed_response(response)
            reponse.dig('data', 'amount')
        end

        def url
            pair = @options.fetch(:pair, 'php')
            "https://api.coingecko.com/api/v3/coins/markets?vs_currency=#{pair.parameterize}&order=market_cap_desc&per_page=250&page=1&sparkline=true"
        end

    end
end