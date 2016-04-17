require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:user_zero)
    session[:user_id] = @user.id
  end

  test "should get index" do
    @comment = comments(:comment)
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    @comment = comments(:comment)
    get :show, id: @comment.id
    assert_response :success
  end

  test "should get edit" do
    @comment = comments(:comment)
    get :edit, id: @comment.id
    assert_response :success
  end

  test "should get delete" do
    @comment = comments(:comment)
    comment_count = Comment.count
    delete :destroy, id: @comment.id
    assert_redirected_to controller: "comments", action: "index"
    assert_equal comment_count - 1, Comment.count
  end

  test "should get update" do
    @comment = comments(:comment)
    patch :update, id: @comment.id, comment: { body: "I'm a little teapot"}
    assert_redirected_to controller: "comments", action: "index"
    assert_equal "I'm a little teapot", assigns(:comment).body
  end

  test "should get create" do
    @user = users(:user_zero)
    session[:user_id] = @user.id
    prev_comment_count = Comment.count
    post :create, comment: { body: "I'm a little teapot", user_id: @user.id }
    assert assigns(:comment).valid?
    assert_equal "I'm a little teapot", assigns(:comment).body
    assert_equal prev_comment_count + 1, Comment.count
  end

end
