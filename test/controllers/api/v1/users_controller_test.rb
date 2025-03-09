require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get current" do
    get api_v1_users_current_url
    assert_response :success
  end
end
