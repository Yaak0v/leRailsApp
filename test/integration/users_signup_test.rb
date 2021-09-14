require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup info" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: { name: "", email: "user@invalid", password: "", password_confirmation: ""} }
    end
    assert_template "users/new"
  end
    test "valid signup info" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: { name: "example user", email: "user@example.com", password: "123456", password_confirmation: "123456"} }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end