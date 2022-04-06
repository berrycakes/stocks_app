class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :trader
  after_create :update_balance

  def stock_name
    Stock.find(stock_id).name
  end

  def stock_symbol
    Stock.find(stock_id).symbol
  end


  def stock_image
    Stock.find(self.stock_id).image
  end

  def purchase_value
    self.price * self.stock_share
  end

  def current_price
    Stock.find(self.stock_id).current_price
  end

  def current_value
    current_price * self.stock_share
  end

  def self.available_stock_share(stock_id, trader_id); end

  def profit_loss
    current_value - purchase_value
  end

  def percent_change
    (current_value - purchase_value) / purchase_value
  end

  def update_balance
    wallet = Wallet.find_by(trader_id: trader_id)
    case transaction_type
    when 'buy'
      wallet.balance -= total_price
    when 'sell'
      wallet.balance += total_price
    end
    wallet.save
  end
end
