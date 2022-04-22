require 'rails_helper'

RSpec.feature 'Stock Transactions', type: :feature do
  # Trader has 100,000 in balance
  let!(:user) {create(:user, :trader, :approved)}
  let!(:stock) { create(:stock) }
  before :each do
    sign_in user
  end

  scenario 'Trader can buy a stock' do
    visit '/stocks/1'

    expect(page).to have_text('Solana')
    fill_in('Buy Investment Shares', with: '3')
    click_on('BUY Solana')


    expect(page).to have_text('BUY ORDER FULFILLED')
    expect(page).to have_text('Solana')
    expect(page).to have_text('3')

    buy_txn = user.trader.reload.transactions.find_by(transaction_type: 'buy', stock_share: 3)

    expect(buy_txn).not_to be_nil
    expect(buy_txn.stock_share).to eql(3)
    expect(buy_txn.stock.name).to eql('Solana')
    expect(user.trader.reload.wallet.balance).to be < 100_000
  end

  scenario 'Trader can sell a stock' do
    user.trader.transactions.create(attributes_for(:transaction))
    visit '/stocks/1'

    expect(page).to have_text('Solana')
    find_button(id: 'toggle_sell_button').click
    fill_in('Sell Investment Shares', with: '4')
    click_button('SELL Solana')

    expect(page).to have_text('SELL ORDER FULFILLED')
    expect(page).to have_text('Solana')
    expect(page).to have_text('4')

    sell_txn = user.trader.transactions.find_by(transaction_type: 'sell', stock_share: 4)

    expect(sell_txn).not_to be_nil
    expect(sell_txn.stock.name).to eql('Solana')
  end
end
