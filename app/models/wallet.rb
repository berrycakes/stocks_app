class Wallet < ApplicationRecord
  belongs_to :trader
  has_many :wallet_transactions
end
