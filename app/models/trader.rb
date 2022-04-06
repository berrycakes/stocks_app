class Trader < ApplicationRecord
  belongs_to :user
  has_one :wallet
  has_many :wallet_transactions, through: :wallet
end
