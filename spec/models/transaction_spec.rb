require 'rails_helper'

RSpec.describe Transaction, type: :model do
    let!(:current_user) {User.create(id: 100, email: "test@email.com", password: "password", confirmed_at: DateTime.now, role: 1 )}
    let!(:trader) {Trader.create(id: 100, user_id: 100, approved: true) }
    let!(:wallet) {Wallet.create(id: 100, balance: 10000, trader_id: 100)}
    let!(:stock) {Stock.create(id: 100, name: "Stock Test Name", image: "https://correctformat.com", symbol: "UNIQUE", slug: "unique-slug")}
    let!(:buy_transaction) {Transaction.new(id: 1, stock_id: 100, stock_share: 2, price: 2000, transaction_type: "buy", date: DateTime.now, trader_id: 100)}
    let!(:sell_transaction) {Transaction.new(id: 2, stock_id: 100, stock_share: 2, price: 2000, transaction_type: "sell", date: DateTime.now, trader_id: 100)}
        
    context 'date' do
        it 'raise error when empty' do
            date_blank = Transaction.create(date: nil)
            expect(date_blank).to_not be_valid
            expect(date_blank.errors).to be_present
            expect(date_blank.errors.to_hash.keys).to include(:date)
            expect(date_blank.errors[:date]).to include("can't be blank")
        end

        it 'raise error if date is later than current date' do
            date_later = Transaction.create(date: Date.new(2099))
            expect(date_later).to_not be_valid
            expect(date_later.errors).to be_present
            expect(date_later.errors.to_hash.keys).to include(:date)
            expect(date_later.errors[:date]).to include("should not be later than today")
        end
    end

    context 'transaction type' do
        it 'raise error when empty' do
            type_blank = Transaction.create(transaction_type: nil)
            expect(type_blank).to_not be_valid
            expect(type_blank.errors).to be_present
            expect(type_blank.errors.to_hash.keys).to include(:transaction_type)
            expect(type_blank.errors[:transaction_type]).to include("can't be blank")
        end

        it 'raise error if transaction type is not buy or sell' do
            type_wrong = Transaction.create(transaction_type: "wrong")
            expect(type_wrong).to_not be_valid
            expect(type_wrong.errors).to be_present
            expect(type_wrong.errors.to_hash.keys).to include(:transaction_type)
            expect(type_wrong.errors[:transaction_type]).to include("only accepts buy or sell")
        end
    end

    context 'stock share' do
        it 'raise error when empty' do
            stock_share_blank = Transaction.create(stock_share: nil)
            expect(stock_share_blank).to_not be_valid
            expect(stock_share_blank.errors).to be_present
            expect(stock_share_blank.errors.to_hash.keys).to include(:stock_share)
            expect(stock_share_blank.errors[:stock_share]).to include("can't be blank")
        end

        it 'raise error if stock share is zero' do
            stock_share_zero = Transaction.create(stock_share: 0)
            expect(stock_share_zero).to_not be_valid
            expect(stock_share_zero.errors).to be_present
            expect(stock_share_zero.errors.to_hash.keys).to include(:stock_share)
            expect(stock_share_zero.errors[:stock_share]).to include("must be greater than 0")
        end
    end

    context 'price' do
        it 'raise error when empty' do
            price_blank = Transaction.create(price: nil)
            expect(price_blank).to_not be_valid
            expect(price_blank.errors).to be_present
            expect(price_blank.errors.to_hash.keys).to include(:price)
            expect(price_blank.errors[:price]).to include("can't be blank")
        end

        it 'raise error if stock share is zero' do
            price_zero = Transaction.create(price: 0)
            expect(price_zero).to_not be_valid
            expect(price_zero.errors).to be_present
            expect(price_zero.errors.to_hash.keys).to include(:price)
            expect(price_zero.errors[:price]).to include("must be greater than 0")
        end
    end

    context 'buy transactions' do
        it 'expect valid credentials to be used for transaction' do
            expect(current_user).to be_valid
            expect(stock).to be_valid
            expect(trader).to be_valid
            expect(wallet).to be_valid
            expect(wallet.balance).to eq(10000)
        end

        it 'buy stock and update stock shares with sufficient balance ' do
            allow(buy_transaction.stock).to receive(:current_price).and_return(2000)
            buy_transaction.save

            expect(buy_transaction).to be_valid
            expect(stock.available_shares(trader.id)). to eq(2)
        end

        it 'prevent buying and raise error with insufficient balance' do
            buy_transaction.stock_share = 6

            allow(buy_transaction.stock).to receive(:current_price).and_return(2000)
            buy_transaction.save

            expect(buy_transaction.purchase_value).to eq(12000)
            expect(buy_transaction).to_not be_valid  
            expect(buy_transaction.errors).to be_present
            expect(buy_transaction.errors.to_hash.keys).to include(:stock_share)
            expect(buy_transaction.errors[:stock_share]).to include("should be decreased. Insufficient balance")
        end
    end

    context 'sell transactions' do
        it 'expect valid credentials to be used for transaction' do
            expect(current_user).to be_valid
            expect(stock).to be_valid
            expect(trader).to be_valid
            expect(wallet).to be_valid
        end

        it 'sell stock and update stock shares with sufficient available shares ' do
            allow(buy_transaction.stock).to receive(:current_price).and_return(2000)
            buy_transaction.save
            expect(buy_transaction).to be_valid  
            
            allow(sell_transaction.stock).to receive(:current_price).and_return(5000)
            allow(sell_transaction.stock).to receive("available_shares").and_return(stock.available_shares(trader.id))
            sell_transaction.save

            expect(sell_transaction).to be_valid  
            expect(stock.available_shares(trader.id)). to eq(0) 
        end

        it 'prevent selling and raise error with insufficient available shares' do
            allow(buy_transaction.stock).to receive(:current_price).and_return(2000)
            buy_transaction.save
            expect(buy_transaction).to be_valid  
            
            
            sell_transaction.stock_share = 5 
            allow(sell_transaction.stock).to receive(:current_price).and_return(5000)
            allow(sell_transaction.stock).to receive("available_shares").and_return(stock.available_shares(trader.id))
            sell_transaction.save

            expect(sell_transaction).to_not be_valid  
            expect(sell_transaction.errors).to be_present
            expect(sell_transaction.errors.to_hash.keys).to include(:stock_share)
            expect(sell_transaction.errors[:stock_share]).to include("greater than available. Insufficient balance")
        end
    end
end