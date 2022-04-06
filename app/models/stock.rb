class Stock < ApplicationRecord
  has_many :transactions
  has_many :traders, through: :transactions
  accepts_nested_attributes_for :transactions

  @@market_data = []

  def self.get_market_data(currency)
    # ids = Stock.select(:slug).map(&:slug).join(",")
    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=#{currency.parameterize}&order=market_cap_desc&per_page=250&page=1&sparkline=true"
    request = HTTParty.get(url)
    response = JSON.parse(request.body)
  end

  def self.set_market_data
    @@market_data = get_market_data('php')
  end

  set_market_data

  def get_data
    data = @@market_data.select { |coin| coin['symbol'] == symbol.to_s }
  end

  def current_price
    get_data[0].dig('current_price')
  end

  def current_market_cap
    get_data[0].dig('market_cap')
  end

  def current_daily_high
    get_data[0].dig('high_24h')
  end

  def current_daily_low
    get_data[0].dig('low_24h')
  end

  def current_daily_change
    get_data[0].dig('price_change_percentage_24h')
  end

  def current_ath
    get_data[0].dig('ath')
  end

  # used for minicharts
  def weekly_sparkline
    get_data[0].dig('sparkline_in_7d', 'price')
  end

  # used for individual big charts
  def get_ohlc
    url = "https://api.coingecko.com/api/v3/coins/#{slug}/ohlc?vs_currency=php&days=7"
    request = HTTParty.get(url)
    response = JSON.parse(request.body)
    response.map { |x| [Time.at(x.shift).to_datetime, x.drop(0)] }
  end
end
