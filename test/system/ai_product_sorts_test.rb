require "application_system_test_case"

class AiProductSortsTest < ApplicationSystemTestCase
  setup do
    @ai_product_sort = ai_product_sorts(:one)
  end

  test "visiting the index" do
    visit ai_product_sorts_url
    assert_selector "h1", text: "Ai product sorts"
  end

  test "should create ai product sort" do
    visit ai_product_sorts_url
    click_on "New ai product sort"

    fill_in "Name", with: @ai_product_sort.name
    fill_in "Uuid", with: @ai_product_sort.uuid
    fill_in "Weight", with: @ai_product_sort.weight
    click_on "Create Ai product sort"

    assert_text "Ai product sort was successfully created"
    click_on "Back"
  end

  test "should update Ai product sort" do
    visit ai_product_sort_url(@ai_product_sort)
    click_on "Edit this ai product sort", match: :first

    fill_in "Name", with: @ai_product_sort.name
    fill_in "Uuid", with: @ai_product_sort.uuid
    fill_in "Weight", with: @ai_product_sort.weight
    click_on "Update Ai product sort"

    assert_text "Ai product sort was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai product sort" do
    visit ai_product_sort_url(@ai_product_sort)
    click_on "Destroy this ai product sort", match: :first

    assert_text "Ai product sort was successfully destroyed"
  end
end
