require 'rails_helper'

RSpec.describe WalletTransaction, type: :model do
  describe '.total_deposit' do
    let(:deposit_transaction) { create(:wallet_transaction) }

    it 'includes transactions with deposit types' do
      expect(WalletTransaction.total_deposit).to include(deposit_transaction)
    end
  end

  # Wallet transaction deposits 1000
  let(:wallet_transaction) { build(:wallet_transaction) }
  let(:wallet) do
    Wallet.new(
      id: 1,
      balance: 1000
    )
  end
  let(:new_transaction) do
    wallet.wallet_transactions.build(
      transaction_type: 'Withdraw',
      amount: 500
    )
  end

  describe '#update_balance' do
    context 'updates wallet balance' do
      it 'deposits' do
        expect { wallet_transaction.update_balance }.to change { wallet_transaction.wallet.balance }.from(0).to(1000)
      end

      it 'withdraws' do
        expect { new_transaction.update_balance }.to change {
                                                       new_transaction.wallet.balance
                                                     }.from(1000).to(500)
      end
    end
  end

  context 'validations' do
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
      new_transaction.amount = 2000

      expect(new_transaction).to_not be_valid
      expect(new_transaction.errors).to be_present
      expect(new_transaction.errors.to_hash.keys).to include(:amount)
      expect(new_transaction.errors[:amount]).to include('Insufficient Balance for withdrawal')
    end
  end
end
