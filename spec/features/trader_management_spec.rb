require 'rails_helper'

RSpec.feature 'Trader Management', type: :feature do
  let(:admin) { create(:admin) }
  let(:trader) { create(:trader) }

  before :each do
    sign_in admin
  end

  scenario 'Admin can create a new trader' do
    visit '/users/sign_up'

    expect(page).to have_text('Create Account')

    select('Trader', from: 'Role')
    fill_in('Email', with: 'trader1@email.com')
    fill_in('Password', with: 'password')
    fill_in('Password Confirmation', with: 'password')

    click_button('Submit')

    expect(page).to have_text(/Please follow the link to activate your account./)

    user = User.find_by(email: 'trader1@email.com')
    expect(user).not_to be_nil
    expect(user.trader).not_to be_nil
  end

  scenario 'Admin can approve a trader' do
    expect(trader.approved).to eql(false)

    visit traders_pending_approval_path

    find_button(id: 'approve_1').click

    expect(trader.reload.approved).to eql(true)
  end

  scenario 'Admin can edit trader info' do
    user = create(:user, id: 3, email: 'edittrader@email.com')

    visit '/admins/traders/3/edit'
    expect(page).to have_text('Edit')

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Lloyd')
    fill_in('Mobile Number', with: '999')

    click_on('Update')

    expect(page).to have_text(/List of Traders/)
    expect(page).to have_text(/John Lloyd/)

    expect(user.trader.reload.first_name).to eql('John')
    expect(user.trader.reload.last_name).to eql('Lloyd')
    expect(user.trader.reload.mobile_number).to eql('999')
  end
end
