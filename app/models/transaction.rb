class Transaction < ApplicationRecord
  belongs_to :stock
  belongs_to :trader
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

  private

  # Updates wallet balance after succesful transaction
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
