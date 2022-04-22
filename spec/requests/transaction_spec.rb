require 'rails_helper'

RSpec.describe '/traders', type: :request do
  let!(:admin) { create(:user, :admin) }
  let!(:stock) { create(:stock) }
  let!(:trader) do
    create(:user, :trader, :approved) do |user|
      user.trader.transactions.create(attributes_for(:transaction))
    end
  end

  context 'admin' do
    describe 'GET /index' do
      it 'shows all the transactions' do
        sign_in admin
        get transactions_path

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('List of Transactions')
        expect(response.body).to include('Solana')
        expect(response.body).to include('BUY')
      end
    end
  end

  context 'trader' do
    before :each do
      sign_in trader
    end
    describe 'GET /index' do
      it 'shows all the transactions the trader has' do
        get transactions_path

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('List of Transactions')
        expect(response.body).to include('Solana')
        expect(response.body).to include('BUY')
      end
    end

    describe 'GET /show' do
      it 'shows the transaction details' do
        get transaction_path(trader.trader.transactions.first.id)

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('BUY ORDER FULFILLED')
        expect(response.body).to include('5')
        expect(response.body).to include('Solana')
      end
    end

    describe 'GET /portfolio' do
      it 'shows the portfolio' do
        get portfolio_path

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Portfolio')
        expect(response.body).to include('Profit & Loss')
        expect(response.body).to include('Solana')
      end
    end

    describe 'POST /transactions' do
      it 'creates a transaction to buy a stock' do
        post '/transactions',
             params: { transaction: { stock_id: 1, trader_id: trader.trader.id,
                                      transaction_type: 'buy',
                                      stock_share: 5, date: Time.now,
                                      price: 100 } }
        expect(response).to redirect_to(/transactions/)
        follow_redirect!

        expect(response.body).to include('Transaction was successfully created')
        expect(response.body).to include('BUY ORDER FULFILLED')
        expect(response.body).to include('Solana')
        expect(response.body).to include('5')
      end
    end
  end
end
