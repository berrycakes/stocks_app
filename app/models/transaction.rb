class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :trader

  validates :date, presence: true
  validate :correct_date
  validates :transaction_type, presence: true, inclusion: { in: %w(buy sell), message: "only accepts buy or sell"} 
  validates :stock_share, presence: true, numericality: {:greater_than => 0}
  validates :price, presence:true, numericality: {:greater_than => 0}
  validate :sufficient_balance
  after_create :update_balance

  def correct_date
    if self.date 
      if self.date > DateTime.now
        errors.add(:date, "should not be later than today" )
      end
    end
  end

  def sufficient_balance
    if stock_share
      if transaction_type == "buy" && self.current_value > trader.wallet.balance
        errors.add(:stock_share, "should be decreased. Insufficient balance")
      end

      if transaction_type == "sell" && stock_share > self.stock.available_shares(trader_id)
        errors.add(:stock_share, "greater than available. Insufficient balance")
      end 
    end
  end

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
