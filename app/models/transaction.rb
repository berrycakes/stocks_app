class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :trader

  validates :date, presence: true
  validates :transaction_type, presence: true
  validates :stock_share, presence: true
  validates :stock_share, numericality: {:greater_than => 0}
  validate :sufficient_balance
  after_create :update_balance

  # actual total price at the time of purchase
  def purchase_value
    price * stock_share
  end

  def current_price
    stock.current_price
  end
  
  def current_value
    current_price * stock_share
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
        errors.add(:stock_share, "greater than available. Insufficient balance")
      end 
    end
  end

  private

  # Updates wallet balance after succesful transaction
  def update_balance
    wallet = Wallet.find_by(trader_id: trader_id)
    case transaction_type
    when 'buy'
      wallet.balance -= purchase_value
    when 'sell'
      wallet.balance += purchase_value
    end
    wallet.save
  end
end
