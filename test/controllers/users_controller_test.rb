require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    @user = users(:user_zero)
    get :show, id: @user.id
    assert_response :success
  end

  test "should get edit" do
    @user = users(:user_zero)
    get :edit, id: @user.id
    assert_response :success
  end

  test "should get delete" do
    @user = users(:user_zero)
    user_count = User.count
    delete :destroy, id: @user.id
    assert_redirected_to controller: "users", action: "index"
    assert_equal user_count - 1, User.count
  end

  test "should get update" do
    @username = users(:user_zero)
    patch :update, id: @username.id, user: { user_name: "Subverzo" }
    assert_redirected_to controller: "users", action: "show", id: @username.id
    assert_equal "Subverzo", assigns[:user].user_name
  end

  test "should get create" do
    prev_user_count = User.count
    post :create, user: { user_name: "MalachyConstant", password: "pass" }
    assert assigns(:user).valid?
    assert_equal "MalachyConstant", assigns(:user).user_name
    assert_equal prev_user_count + 1, User.count
    # assert_redirected_to controller: "users", action: "show", id: assigns(:user).id
  end

end
