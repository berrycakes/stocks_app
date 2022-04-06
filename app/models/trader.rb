class Trader < ApplicationRecord
  belongs_to :user
  has_one :wallet
  has_many :wallet_transactions, through: :wallet
  has_many :transactions
  has_many :stocks, through: :transactions

  def profit_loss
    total_balance = wallet.balance
    transactions.each do |transaction|
      case transaction.transaction_type
      when 'buy'
        total_balance += transaction.current_amount
      when 'sell'
        total_balance -= transaction.current_amount
      end
    end
    total_balance
  end
end
