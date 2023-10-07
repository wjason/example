require "test_helper"

class DyControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dy_show_url
    assert_response :success
  end
end
