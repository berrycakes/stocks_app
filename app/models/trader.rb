class Trader < ApplicationRecord
  belongs_to :user
  has_one :wallet
  has_many :wallet_transactions, through: :wallet
  has_many :transactions
  has_many :stocks, through: :transactions
end
