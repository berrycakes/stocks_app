class WalletTransaction < ApplicationRecord
  belongs_to :wallet
  after_create :update_balance

  def update_balance
    case transaction_type
    when 'Deposit'
      wallet.balance += amount
    when 'Withdraw'
      wallet.balance -= amount
    end
    wallet.save
  end
end
