require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_users_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'sam', password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to users_url
  end

  test "should show user" do
    get users_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch users_url(@user), params: { user: { name: @user.name, password: 'secret', password_confirmation: 'secret' } }
    assert_redirected_to users_url
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete users_url(@user)
    end

    assert_redirected_to users_url
  end
end
