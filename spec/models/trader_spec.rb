require 'rails_helper'

RSpec.describe Trader, type: :model do
  # wallet_transaction associated with trader through factory
  # Wallet transaction deposits 1000
  let!(:wallet_transaction) { create(:wallet_transaction) }
  let!(:transaction) { build(:transaction) }

  describe '#profit_loss' do
    it 'shows profit or loss' do
      expect(transaction.trader.profit_loss).to eql(1000)
    end
  end

  describe '#percent_change' do
    it 'shows change in percentage' do
      expect(transaction.trader.percent_change).to eql('0.0%')
    end
  end
end
