require 'rails_helper'

RSpec.feature 'Stock Transactions', type: :feature do
  let!(:transaction) { create(:transaction) }
  let(:trader) { transaction.trader }
  before :each do
    sign_in trader.user
  end

  scenario 'Trader can buy a stock' do
    visit '/stocks/1'

    expect(page).to have_text('Solana')
    fill_in('Buy Investment Shares', with: '5')
    click_button('BUY Solana')

    expect(page).to have_text('BUY ORDER FULFILLED')
    expect(page).to have_text('Solana')
    expect(page).to have_text('5')

    expect(trader.reload.transactions.last).not_to be_nil
    expect(trader.reload.transactions.last.stock_share).to eql(5)
    expect(trader.reload.transactions.last.stock.name).to eql('Solana')
    expect(trader.reload.wallet.balance).to be < 100_000
  end

  scenario 'Trader can sell a stock' do
    visit '/stocks/1'

    expect(page).to have_text('Solana')
    find_button(id: 'toggle_sell_button').click
    fill_in('Sell Investment Shares', with: '4')
    click_button('SELL Solana')

    expect(page).to have_text('SELL ORDER FULFILLED')
    expect(page).to have_text('Solana')
    expect(page).to have_text('4')

    expect(trader.reload.transactions.last).not_to be_nil
    expect(trader.reload.transactions.last.stock_share).to eql(4)
    expect(trader.reload.transactions.last.stock.name).to eql('Solana')
  end
end
