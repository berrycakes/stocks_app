class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :trader

  def stock_name
    Stock.find(self.stock_id).name
  end

  def stock_symbol
    Stock.find(self.stock_id).symbol
  end

  def total_price
    self.price * self.stock_share
  end

  def current_amount
    Stock.find(self.stock_id).current_price * self.stock_share
  end

  def self.available_stock_share(stock_id, trader_id)
  end

  def profit_loss
    current_amount - total_price
  end

  def percent_change
    (current_amount - total_price) / total_price
  end


end
