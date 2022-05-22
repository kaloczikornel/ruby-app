require "test_helper"

class SayControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get hello_path
    assert_response :success #:redirect
    assert_select 'h1', 1
  end
end
