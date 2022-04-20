require 'rails_helper'

RSpec.describe Wallet, type: :model do
  describe '#total_balance' do
    let!(:trader) { create(:trader) }

    it 'shows total money deposited by the user' do
      trader.wallet.wallet_transactions.create(
        transaction_type: 'Withdraw',
        amount: 10_000
      )
      expect(trader.wallet.total_balance).to eql(90_000)
    end
  end
end
