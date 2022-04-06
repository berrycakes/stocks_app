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

  def total_price
    price * stock_share
  end

  def current_amount
    Stock.find(stock_id).current_price * stock_share
  end

  def self.available_stock_share(stock_id, trader_id); end

  def profit_loss
    current_amount - total_price
  end

  def percent_change
    (current_amount - total_price) / total_price
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
