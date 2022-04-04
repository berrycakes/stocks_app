class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  def stock_symbol
    Stock.find(self.stock_id).symbol
  end

  def total_price
    self.price * self.stock_share
  end

  def current_amount
    Stock.find(self.stock_id).current_price * self.stock_share
  end

  def profit_loss
    current_amount - total_price
  end

  def percent_change
    (current_amount - total_price) / total_price
  end


end
