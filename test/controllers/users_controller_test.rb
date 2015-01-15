require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, fb_token: @user.fb_token, first_name: @user.first_name, invite_code: @user.invite_code, last_name: @user.last_name, location: @user.location, notification_token: @user.notification_token, status: @user.status, tele: @user.tele, verify_code: @user.verify_code }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, fb_token: @user.fb_token, first_name: @user.first_name, invite_code: @user.invite_code, last_name: @user.last_name, location: @user.location, notification_token: @user.notification_token, status: @user.status, tele: @user.tele, verify_code: @user.verify_code }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
