require 'rails_helper'

RSpec.describe Trader, type: :model do
  describe '#profit_loss' do
    it 'shows profit or loss' do 
        trader = Trader.new
        trader.id = 1
        trader.build_wallet
        trader.wallet.balance = 200
        stock = Stock.create(
            slug: 'bitcoin',
            symbol: 'btc',
            name: 'Bitcoin',
            image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
            max_supply: 21000000
        )
        transaction = stock.transactions.build(trader_id: 1, transaction_type: 'buy', stock_share: 1, price: 10)

        expect(trader.profit_loss).to eql(200)
    end
  end

  describe '#percent_change' do
    it 'shows change in percentage' do 
        wallet = Wallet.create(balance: 200)
        trader = wallet.create_trader
        wallet_transaction = WalletTransaction.create(transaction_type: 'Deposit', amount: 200)
        wallet.wallet_transactions << wallet_transaction
        # stock = Stock.create(
        #     slug: 'bitcoin',
        #     symbol: 'btc',
        #     name: 'Bitcoin',
        #     image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
        #     max_supply: 21000000
        # )
        # transaction = stock.transactions.build(trader_id: 1, transaction_type: 'buy', stock_share: 1, price: 10)
        # p wallet.wallet_transactions
        expect(WalletTransaction.total_deposit).to include(wallet_transaction)
        # expect(trader.percent_change).to be('0.0%')
    end
  end

end