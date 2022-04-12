require 'rails_helper'

RSpec.describe WalletTransaction, type: :model do
  describe '.total_deposit' do 
    it 'includes transactions with deposit types' do
      wallet = Wallet.create!(balance: 0)
      transaction = WalletTransaction.create!(transaction_type: 'Deposit', amount: 200)
      expect(WalletTransaction.total_deposit).to include(transaction)
    end
  end

  describe '#update_balance' do
    context 'updates wallet balance' do
      it 'deposits' do
        wallet = Wallet.new(
          id: 1,
          balance: 5
        )
        wallet_transaction = wallet.wallet_transactions.build(
          id: 1,
          transaction_type: 'Deposit',
          amount: 5
        )
        expect { wallet_transaction.update_balance }.to change { wallet.balance }.from(5).to(10)
      end

      it 'withdraws' do
        wallet = Wallet.new(
          id: 1,
          balance: 10
        )
        wallet_transaction = wallet.wallet_transactions.build(
          id: 1,
          transaction_type: 'Withdraw',
          amount: 5
        )
        expect { wallet_transaction.update_balance }.to change { wallet.balance }.from(10).to(5)
      end
    end
  end

  context 'validations' do
    let(:wallet_transaction) { WalletTransaction.new }
    it 'is not a valid amount' do
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
      wallet = Wallet.new
      wallet_transaction = wallet.wallet_transactions.build
      wallet.balance = 500
      wallet_transaction.transaction_type = 'Withdraw'
      wallet_transaction.amount = 1000

      expect(wallet_transaction).to_not be_valid
      expect(wallet_transaction.errors).to be_present
      expect(wallet_transaction.errors.to_hash.keys).to include(:amount)
      expect(wallet_transaction.errors[:amount]).to include('Insufficient Balance for withdrawal')
    end
  end
end
