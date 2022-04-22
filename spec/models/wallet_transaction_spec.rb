require 'rails_helper'

RSpec.describe WalletTransaction, type: :model do
  let(:wallet) { Wallet.new(id: 1, balance: 1000) }
  let(:wallet_txn) do
    wallet.wallet_transactions.build(
      transaction_type: 'Deposit',
      amount: 500
    )
  end

  describe '.total_deposit' do
    let(:trader) { create(:trader, :approved) }
    it 'includes transactions with deposit types' do
      expect(WalletTransaction.total_deposit)
        .to include(trader.wallet.wallet_transactions.find_by(transaction_type: 'Deposit'))
    end
  end

  describe '#update_balance' do
    context 'updates wallet balance' do
      it 'deposits' do
        expect { wallet_txn.update_balance }
          .to change {
                wallet.balance
              }.from(1000).to(1500)
      end

      it 'withdraws' do
        wallet_txn.transaction_type = 'Withdraw'
        expect { wallet_txn.update_balance }
          .to change {
                wallet.balance
              }.from(1000).to(500)
      end
    end
  end

  context 'validations' do
    let(:trader) { create(:trader, :approved) }
    let(:wallet_transaction) { trader.wallet.wallet_transactions.first }

    it 'is valid with valid attributes' do
      expect(wallet_transaction).to be_valid
    end

    it 'is not a valid amount' do
      wallet_transaction.amount = ''

      expect(wallet_transaction).to_not be_valid
      expect(wallet_transaction.errors).to be_present
      expect(wallet_transaction.errors.to_hash.keys).to include(:amount)
      expect(wallet_transaction.errors[:amount]).to include("can't be blank")
    end

    it 'is not a number' do
      wallet_transaction.amount = 'string'

      expect(wallet_transaction).to_not be_valid
      expect(wallet_transaction.errors).to be_present
      expect(wallet_transaction.errors.to_hash.keys).to include(:amount)
      expect(wallet_transaction.errors[:amount]).to include('is not a number')
    end

    it 'not enough balance for withdrawal' do
      wallet_txn.transaction_type = 'Withdraw'
      wallet_txn.amount = 1100

      expect(wallet_txn).to_not be_valid
      expect(wallet_txn.errors).to be_present
      expect(wallet_txn.errors.to_hash.keys).to include(:amount)
      expect(wallet_txn.errors[:amount]).to include('exceeds balance for withdrawal')
    end
  end
end
