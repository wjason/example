require "test_helper"

class AiProductSortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_product_sort = ai_product_sorts(:one)
  end

  test "should get index" do
    get ai_product_sorts_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_product_sort_url
    assert_response :success
  end

  test "should create ai_product_sort" do
    assert_difference("AiProductSort.count") do
      post ai_product_sorts_url, params: { ai_product_sort: { name: @ai_product_sort.name, uuid: @ai_product_sort.uuid, weight: @ai_product_sort.weight } }
    end

    assert_redirected_to ai_product_sort_url(AiProductSort.last)
  end

  test "should show ai_product_sort" do
    get ai_product_sort_url(@ai_product_sort)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_product_sort_url(@ai_product_sort)
    assert_response :success
  end

  test "should update ai_product_sort" do
    patch ai_product_sort_url(@ai_product_sort), params: { ai_product_sort: { name: @ai_product_sort.name, uuid: @ai_product_sort.uuid, weight: @ai_product_sort.weight } }
    assert_redirected_to ai_product_sort_url(@ai_product_sort)
  end

  test "should destroy ai_product_sort" do
    assert_difference("AiProductSort.count", -1) do
      delete ai_product_sort_url(@ai_product_sort)
    end

    assert_redirected_to ai_product_sorts_url
  end
end
