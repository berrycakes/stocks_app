require 'rails_helper'

RSpec.feature 'Stock Transactions', type: :feature do
  let!(:transaction) do
    create(:transaction) do |transaction|
      transaction.trader.approved = true
      transaction.save
    end
  end
  let(:trader) { transaction.trader }
  before :each do
    sign_in trader.user
  end

  scenario 'Trader can buy a stock' do
    visit '/stocks/1'

    expect(page).to have_text('Solana')
    fill_in('Buy Investment Shares', with: '5')
    click_button('Buy Solana')

    expect(page).to have_text('BUY ORDER FULFILLED')
    expect(page).to have_text('Solana')
    expect(page).to have_text('5')

    expect(trader.reload.transactions.last).not_to be_nil
    expect(trader.reload.transactions.last.stock_share).to eql(5)
    expect(trader.reload.transactions.last.stock.name).to eql('Solana')
  end

  scenario 'Trader can sell a stock' do
    visit '/stocks/1'

    expect(page).to have_text('Solana')
    find_button(id: 'toggle_sell_button').click
    fill_in('Sell Investment Shares', with: '4')
    click_button('Sell Solana')

    expect(page).to have_text('SELL ORDER FULFILLED')
    expect(page).to have_text('Solana')
    expect(page).to have_text('4')

    expect(trader.reload.transactions.last).not_to be_nil
    expect(trader.reload.transactions.last.stock_share).to eql(4)
    expect(trader.reload.transactions.last.stock.name).to eql('Solana')
  end
end
