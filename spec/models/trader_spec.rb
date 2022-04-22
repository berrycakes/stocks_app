require 'rails_helper'

RSpec.describe Trader, type: :model do
  # Wallet contains 100,000
  let!(:trader) { create(:trader, :approved) }
  let!(:transaction) { build(:transaction) }

  describe '#profit_loss' do
    it 'shows profit or loss' do
      expect(transaction.trader.profit_loss).to eql(100_000)
    end
  end

  describe '#percent_change' do
    it 'shows change in percentage' do
      expect(transaction.trader.percent_change).to eql('0.0%')
    end
  end
end
