class Trader < ApplicationRecord
  scope :pending_approval, -> { where('approved = false') }
  belongs_to :user
  has_one :wallet
  has_many :wallet_transactions, through: :wallet
  has_many :transactions
  has_many :watchlists
  has_many :watches, through: :watchlists, source: :stock
  has_many :stocks, through: :transactions
  after_create :default_name

  def default_name
    return unless first_name == ''

    trader = Trader.find(id)

    trader.first_name = "Trader-#{id}"
    trader.save
  end

  def profit_loss
    total_balance = wallet.balance
    transactions.each do |transaction|
      case transaction.transaction_type
      when 'buy'
        total_balance += transaction.current_value
      when 'sell'
        total_balance -= transaction.current_value
      end
    end
    total_balance
  end

  def percent_change
    "#{(100 * (profit_loss - wallet.total_balance) / wallet.total_balance).round(2)}%"
  end
end
