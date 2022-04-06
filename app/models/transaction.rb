class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :trader



  # actual total price at the time of purchase

  def purchase_value
    self.price * self.stock_share
  end

  def current_price
    self.stock.current_price
  end

  def current_value
    current_price * self.stock_share
  end

  def self.available_stock_share(stock_id, trader_id)
    "hello"
  end

  def profit_loss
    current_value - purchase_value
  end

  def percent_change
    (current_value - purchase_value) / purchase_value
  end


end
