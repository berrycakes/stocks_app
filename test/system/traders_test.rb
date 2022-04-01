require "application_system_test_case"

class TradersTest < ApplicationSystemTestCase
  setup do
    @trader = traders(:one)
  end

  test "visiting the index" do
    visit traders_url
    assert_selector "h1", text: "Traders"
  end

  test "creating a Trader" do
    visit traders_url
    click_on "New Trader"

    check "Approved" if @trader.approved
    fill_in "First name", with: @trader.first_name
    fill_in "Last name", with: @trader.last_name
    fill_in "Mobile number", with: @trader.mobile_number
    fill_in "User", with: @trader.user_id
    click_on "Create Trader"

    assert_text "Trader was successfully created"
    click_on "Back"
  end

  test "updating a Trader" do
    visit traders_url
    click_on "Edit", match: :first

    check "Approved" if @trader.approved
    fill_in "First name", with: @trader.first_name
    fill_in "Last name", with: @trader.last_name
    fill_in "Mobile number", with: @trader.mobile_number
    fill_in "User", with: @trader.user_id
    click_on "Update Trader"

    assert_text "Trader was successfully updated"
    click_on "Back"
  end

  test "destroying a Trader" do
    visit traders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trader was successfully destroyed"
  end
end
