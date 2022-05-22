require "test_helper"

class NewWineTest < ActionDispatch::IntegrationTest
  test "new wine add for user" do
    get hello_path
    assert_response :success
    assert_select "legend", "Login"

    post '/sessions/create', params: { email: users(:one).email, password: 'titok' }, headers: { 'HTTP_REFERER': hello_path }
    assert_response :redirect
    assert_equal session[:user], users(:one).id
    follow_redirect!
    assert_select 'a', 'Wines'

    get new_wine_path, params: { name: "Olaszrizling", type: "white", vintage: 2021 }, headers: {'HTTP_REFER': new_wine_path}
    assert_response :success
    assert_select 'form', 1

    get '/sessions/destroy', headers: { 'HTTP_REFERER': hello_path }
    assert_response :redirect
    assert_nil session[:user]
    follow_redirect!
    assert_select 'legend', 'Login'
  end
end
