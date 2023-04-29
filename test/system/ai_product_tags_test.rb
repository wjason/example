require "application_system_test_case"

class AiProductTagsTest < ApplicationSystemTestCase
  setup do
    @ai_product_tag = ai_product_tags(:one)
  end

  test "visiting the index" do
    visit ai_product_tags_url
    assert_selector "h1", text: "Ai product tags"
  end

  test "should create ai product tag" do
    visit ai_product_tags_url
    click_on "New ai product tag"

    fill_in "Ai product", with: @ai_product_tag.ai_product_id
    fill_in "Name", with: @ai_product_tag.name
    click_on "Create Ai product tag"

    assert_text "Ai product tag was successfully created"
    click_on "Back"
  end

  test "should update Ai product tag" do
    visit ai_product_tag_url(@ai_product_tag)
    click_on "Edit this ai product tag", match: :first

    fill_in "Ai product", with: @ai_product_tag.ai_product_id
    fill_in "Name", with: @ai_product_tag.name
    click_on "Update Ai product tag"

    assert_text "Ai product tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai product tag" do
    visit ai_product_tag_url(@ai_product_tag)
    click_on "Destroy this ai product tag", match: :first

    assert_text "Ai product tag was successfully destroyed"
  end
end
