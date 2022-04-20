class WalletTransaction < ApplicationRecord
  scope :total_deposit, -> { where(transaction_type: 'Deposit') }
  scope :total_withdrawal, -> { where(transaction_type: 'Withdraw') }
  belongs_to :wallet
  after_create :update_balance
  validates :amount, presence: true, numericality: true
  validate :enough_balance_for_withdrawal

  def enough_balance_for_withdrawal
    return unless transaction_type == 'Withdraw' && amount > wallet.balance

    errors.add(:amount, 'exceeds balance for withdrawal')
  end

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
