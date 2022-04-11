class Watchlist < ApplicationRecord
  belongs_to :stock
  belongs_to :trader
end
