class Stock < ApplicationRecord
    @@market_data = []

    def self.get_market_data(currency)
        # ids = Stock.select(:slug).map(&:slug).join(",")
        url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=#{currency.parameterize}&order=market_cap_desc&per_page=250&page=1&sparkline=true"
        request = HTTParty.get(url)
        response = JSON.parse(request.body)
    end
  
    def self.set_market_data
        @@market_data = get_market_data("php")
    end
    
    set_market_data

    def get_data
        data =  @@market_data.select {|coin| coin["symbol"] == self.symbol.to_s }
    end
    
    def current_price
        self.get_data()[0].dig("current_price")
    end

    def current_market_cap
        self.get_data()[0].dig("market_cap")
    end

    def current_daily_high
        self.get_data()[0].dig("high_24h")
    end

    def current_daily_low
        self.get_data()[0].dig("low_24h")
    end

    def current_daily_change
        self.get_data()[0].dig("price_change_percentage_24h")
    end

    def current_ath
        self.get_data()[0].dig("ath")
    end

    def weekly_sparkline
        self.get_data()[0].dig("sparkline_in_7d", "price")
    end


end
