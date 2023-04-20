require "application_system_test_case"

class AiProductsTest < ApplicationSystemTestCase
  setup do
    @ai_product = ai_products(:one)
  end

  test "visiting the index" do
    visit ai_products_url
    assert_selector "h1", text: "Ai products"
  end

  test "should create ai product" do
    visit ai_products_url
    click_on "New ai product"

    fill_in "Ai product sort", with: @ai_product.ai_product_sort
    fill_in "Company", with: @ai_product.company
    fill_in "Country", with: @ai_product.country
    fill_in "Cover", with: @ai_product.cover
    fill_in "Des", with: @ai_product.des
    fill_in "Intro", with: @ai_product.intro
    fill_in "Name", with: @ai_product.name
    fill_in "Uri", with: @ai_product.uri
    fill_in "Uuid", with: @ai_product.uuid
    fill_in "Weight", with: @ai_product.weight
    click_on "Create Ai product"

    assert_text "Ai product was successfully created"
    click_on "Back"
  end

  test "should update Ai product" do
    visit ai_product_url(@ai_product)
    click_on "Edit this ai product", match: :first

    fill_in "Ai product sort", with: @ai_product.ai_product_sort
    fill_in "Company", with: @ai_product.company
    fill_in "Country", with: @ai_product.country
    fill_in "Cover", with: @ai_product.cover
    fill_in "Des", with: @ai_product.des
    fill_in "Intro", with: @ai_product.intro
    fill_in "Name", with: @ai_product.name
    fill_in "Uri", with: @ai_product.uri
    fill_in "Uuid", with: @ai_product.uuid
    fill_in "Weight", with: @ai_product.weight
    click_on "Update Ai product"

    assert_text "Ai product was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai product" do
    visit ai_product_url(@ai_product)
    click_on "Destroy this ai product", match: :first

    assert_text "Ai product was successfully destroyed"
  end
end
