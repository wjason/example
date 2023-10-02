require "application_system_test_case"

class MyContactCardsTest < ApplicationSystemTestCase
  setup do
    @my_contact_card = my_contact_cards(:one)
  end

  test "visiting the index" do
    visit my_contact_cards_url
    assert_selector "h1", text: "My contact cards"
  end

  test "should create my contact card" do
    visit my_contact_cards_url
    click_on "New my contact card"

    fill_in "Qrcode", with: @my_contact_card.QRcode
    fill_in "Avatar", with: @my_contact_card.avatar
    fill_in "Code", with: @my_contact_card.code
    fill_in "Title", with: @my_contact_card.title
    click_on "Create My contact card"

    assert_text "My contact card was successfully created"
    click_on "Back"
  end

  test "should update My contact card" do
    visit my_contact_card_url(@my_contact_card)
    click_on "Edit this my contact card", match: :first

    fill_in "Qrcode", with: @my_contact_card.QRcode
    fill_in "Avatar", with: @my_contact_card.avatar
    fill_in "Code", with: @my_contact_card.code
    fill_in "Title", with: @my_contact_card.title
    click_on "Update My contact card"

    assert_text "My contact card was successfully updated"
    click_on "Back"
  end

  test "should destroy My contact card" do
    visit my_contact_card_url(@my_contact_card)
    click_on "Destroy this my contact card", match: :first

    assert_text "My contact card was successfully destroyed"
  end
end
