require 'rails_helper'

RSpec.feature 'Wallet Transactions', type: :feature do
  let!(:user) { create(:user, :trader, :approved) }
  before :each do
    sign_in user
  end

  scenario 'Trader can deposit' do
    visit '/wallet/new_transactions'

    expect(page).to have_text('Buying Power')

    fill_in('Amount', with: '50')
    click_on('Submit')

    expect(page).to have_text('Transaction')
    expect(page).to have_text('Deposit')
    expect(page).to have_text('50')
  end

  scenario 'Trader can withdraw' do
    visit '/wallet/new_transactions'

    expect(page).to have_text('Buying Power')

    select('Withdraw', from: 'Transaction Type')
    fill_in('Amount', with: '200')
    click_on('Submit')

    expect(page).to have_text('Transaction')
    expect(page).to have_text('Withdraw')
    expect(page).to have_text('200')
  end
end
