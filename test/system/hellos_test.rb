require "application_system_test_case"

class HellosTest < ApplicationSystemTestCase
  test "visiting the root page" do
    visit '/say/hello'
    assert_selector 'legend', text: "Login"

    fill_in "Email", with: 'test@dev.com'
    fill_in "Password", with: 'titok'
    click_on "Login"

    assert_selector 'a', text: "Logout"
  end
end
