class Stock < ApplicationRecord

    # def get_market_data(currency)
    #     ids = Stock.select(:slug).map(&:slug).join(",")
    #     url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=#{currency.parameterize}&order=market_cap_desc&per_page=250&page=1&sparkline=true"
    #     request = HTTParty.get(url)
    #     response = JSON.parse(request.body)
    # end
  
    # def set_market_data
    #     @market_data = get_market_data("php")
    # end

    # @@data =  @market_data.select {|coin| coin["symbol"] == self.symbol.to_s }

    # def current_price
    #     number_to_currency(data[0].dig("current_price"), unit: "₱ ", separator: ".", delimiter: ",").to_s
    # end

    # def current_market_cap
    #     number_to_currency(data[0].dig("market_cap"), unit: "₱ ", separator: ".", delimiter: ",").to_s
    # end


end
