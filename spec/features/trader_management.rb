require 'rails_helper'

RSpec.feature 'Trader Management', type: :feature do
  let(:admin) { create(:admin) }
  scenario 'Admin creates a new trader' do
    sign_in admin
    visit new_user_registration_path

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
end
