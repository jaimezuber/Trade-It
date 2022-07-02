require "test_helper"

class TradesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get trades_new_url
    assert_response :success
  end

  test "should get create" do
    get trades_create_url
    assert_response :success
  end
end
