require 'rails_helper'

RSpec.describe Wallet, type: :model do
  describe '#total_balance' do
    # Wallet Transaction deposits 1000
    let!(:wallet_transaction) { create(:wallet_transaction) }

    it 'shows total money deposited by the user' do
      wallet_transaction.wallet.wallet_transactions.create(
        transaction_type: 'Withdraw',
        amount: 500
      )
      expect(wallet_transaction.wallet.total_balance).to eql(500)
    end
  end
end
