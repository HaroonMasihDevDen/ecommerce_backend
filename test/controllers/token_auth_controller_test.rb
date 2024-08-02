require "test_helper"

class TokenAuthControllerTest < ActionDispatch::IntegrationTest
  test "should get validate" do
    get token_auth_validate_url
    assert_response :success
  end
end
