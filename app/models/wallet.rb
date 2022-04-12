class Wallet < ApplicationRecord
  belongs_to :trader
  has_many :wallet_transactions

  def total_balance
    wallet_transactions.total_deposit.sum(:amount) - wallet_transactions.total_withdrawal.sum(:amount)
  end
end
