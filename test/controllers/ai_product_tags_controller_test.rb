require "test_helper"

class AiProductTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_product_tag = ai_product_tags(:one)
  end

  test "should get index" do
    get ai_product_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_product_tag_url
    assert_response :success
  end

  test "should create ai_product_tag" do
    assert_difference("AiProductTag.count") do
      post ai_product_tags_url, params: { ai_product_tag: { ai_product_id: @ai_product_tag.ai_product_id, name: @ai_product_tag.name } }
    end

    assert_redirected_to ai_product_tag_url(AiProductTag.last)
  end

  test "should show ai_product_tag" do
    get ai_product_tag_url(@ai_product_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_product_tag_url(@ai_product_tag)
    assert_response :success
  end

  test "should update ai_product_tag" do
    patch ai_product_tag_url(@ai_product_tag), params: { ai_product_tag: { ai_product_id: @ai_product_tag.ai_product_id, name: @ai_product_tag.name } }
    assert_redirected_to ai_product_tag_url(@ai_product_tag)
  end

  test "should destroy ai_product_tag" do
    assert_difference("AiProductTag.count", -1) do
      delete ai_product_tag_url(@ai_product_tag)
    end

    assert_redirected_to ai_product_tags_url
  end
end
