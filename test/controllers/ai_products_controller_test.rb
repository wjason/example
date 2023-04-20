require "test_helper"

class AiProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_product = ai_products(:one)
  end

  test "should get index" do
    get ai_products_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_product_url
    assert_response :success
  end

  test "should create ai_product" do
    assert_difference("AiProduct.count") do
      post ai_products_url, params: { ai_product: { ai_product_sort: @ai_product.ai_product_sort, company: @ai_product.company, country: @ai_product.country, cover: @ai_product.cover, des: @ai_product.des, intro: @ai_product.intro, name: @ai_product.name, uri: @ai_product.uri, uuid: @ai_product.uuid, weight: @ai_product.weight } }
    end

    assert_redirected_to ai_product_url(AiProduct.last)
  end

  test "should show ai_product" do
    get ai_product_url(@ai_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_product_url(@ai_product)
    assert_response :success
  end

  test "should update ai_product" do
    patch ai_product_url(@ai_product), params: { ai_product: { ai_product_sort: @ai_product.ai_product_sort, company: @ai_product.company, country: @ai_product.country, cover: @ai_product.cover, des: @ai_product.des, intro: @ai_product.intro, name: @ai_product.name, uri: @ai_product.uri, uuid: @ai_product.uuid, weight: @ai_product.weight } }
    assert_redirected_to ai_product_url(@ai_product)
  end

  test "should destroy ai_product" do
    assert_difference("AiProduct.count", -1) do
      delete ai_product_url(@ai_product)
    end

    assert_redirected_to ai_products_url
  end
end
