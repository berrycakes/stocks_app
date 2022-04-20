class Stock < ApplicationRecord
    has_many :transactions
    has_many :watchlists
    has_many :watched_by, through: :watchlists, source: :trader
    accepts_nested_attributes_for :transactions

    validates :name, presence: true, length: { in: 2..50 }, uniqueness: true
    validates :image, presence: true, uniqueness: true
    validates_format_of :image, :with => URI::regexp(%w[http https])
    validates :symbol, presence: true, length: { in: 2..10 }, uniqueness: true
    validates :slug, presence: true, length: { in: 2..50 }, uniqueness: true
    validates_format_of :slug, :with =>  /\A(?!\d+\z)[^\s!#$%^&*()（）=+;:'"\[\]\{\}|\\\/<>?,]+\z/

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
        self.get_data[0].dig("current_price")
    end

    def current_market_cap
        self.get_data[0].dig("market_cap")
    end

    def current_daily_high
        self.get_data[0].dig("high_24h")
    end

    def current_daily_low
        self.get_data[0].dig("low_24h")
    end

    def current_daily_change
        self.get_data[0].dig("price_change_percentage_24h")
    end

    def current_ath
        self.get_data[0].dig("ath")
    end

    def daily_volume
        self.get_data[0].dig("total_volume")
    end

    # used for minicharts
    def weekly_sparkline
        self.get_data[0].dig("sparkline_in_7d", "price")
    end

    # used for individual big charts
    def get_ohlc
        url = "https://api.coingecko.com/api/v3/coins/#{self.slug}/ohlc?vs_currency=php&days=7"
        request = HTTParty.get(url)
        response = JSON.parse(request.body)
        response.map { |x| [Time.at(x.shift/1000),  x.drop(0)]}
    end

    def total_shares(trader)
        self.transactions.where(:trader_id => trader).group(:transaction_type).sum(:stock_share)
    end

    def available_shares(trader)
        total_shares(trader).dig("sell") ? total_shares(trader).dig("buy") - total_shares(trader).dig("sell") : total_shares(trader).dig("buy")
    end

    def self.search(search)
        if search
            wildcard_search = "%#{search}%"
            Stock.where("name ILIKE :search OR symbol ILIKE :search OR slug ILIKE :search", search: wildcard_search)
        else
            Stock.all
        end
    end

end
