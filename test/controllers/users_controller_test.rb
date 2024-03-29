require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get forgotten" do
    get users_forgotten_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end
end
