require "test_helper"

class MyContactCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_contact_card = my_contact_cards(:one)
  end

  test "should get index" do
    get my_contact_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_my_contact_card_url
    assert_response :success
  end

  test "should create my_contact_card" do
    assert_difference("MyContactCard.count") do
      post my_contact_cards_url, params: { my_contact_card: { QRcode: @my_contact_card.QRcode, avatar: @my_contact_card.avatar, code: @my_contact_card.code, title: @my_contact_card.title } }
    end

    assert_redirected_to my_contact_card_url(MyContactCard.last)
  end

  test "should show my_contact_card" do
    get my_contact_card_url(@my_contact_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_contact_card_url(@my_contact_card)
    assert_response :success
  end

  test "should update my_contact_card" do
    patch my_contact_card_url(@my_contact_card), params: { my_contact_card: { QRcode: @my_contact_card.QRcode, avatar: @my_contact_card.avatar, code: @my_contact_card.code, title: @my_contact_card.title } }
    assert_redirected_to my_contact_card_url(@my_contact_card)
  end

  test "should destroy my_contact_card" do
    assert_difference("MyContactCard.count", -1) do
      delete my_contact_card_url(@my_contact_card)
    end

    assert_redirected_to my_contact_cards_url
  end
end
