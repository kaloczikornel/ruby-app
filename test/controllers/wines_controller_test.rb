require "test_helper"

class WinesControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get wines_form_url
    assert_response :success
  end
end
