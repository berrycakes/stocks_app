class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :trader

  validates :trader_id, presence: true
  validates :stock_id, presence: true
  validates :date, presence: true
  validates :transaction_type, presence: true
  validates :stock_share, presence: true
  validate :sufficient_balance

  def purchase_value
    self.price * self.stock_share
  end

  def current_price
    self.stock.current_price
  end

  def current_value
    current_price * self.stock_share
  end

  def profit_loss
    current_value - purchase_value
  end

  def percent_change
    (current_value - purchase_value) / purchase_value
  end

  def sufficient_balance
    if stock_share
      if transaction_type == "buy" && self.current_value > trader.wallet.balance
        errors.add(:stock_share, "insufficient balance")
      end

      if transaction_type == "sell" && stock_share > Stock.find(stock_id).available_shares
        errors.add(:stock_share, "insufficient balance")
      end 
    end
  end
end
