require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:user_zero)
    session[:user_id] = @user.id
  end

  test "should get index" do
    @link = links(:tacocat)
    @comment = comments(:comment)
    get :index, link_id: @link.id
    assert_response :success
  end

  test "should get new" do
    @link = links(:tacocat)
    get :new, id: @link.id
    assert_response :success
  end

  test "should get show" do
    @link = links(:tacocat)
    @comment = comments(:comment)
    get :show
    assert_response :success
  end

  test "should get edit" do
    @link = links(:tacocat)
    @comment = comments(:comment)
    get :edit, link_id: @comment.link_id
    assert_response :success
  end

  test "should get delete" do
    @link = links(:tacocat)
    @comment = comments(:comment)
    comment_count = Comment.count
    delete :destroy, link_id: @comment.link_id
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
    @link = links(:tacocat)
    @user = users(:user_zero)
    prev_comment_count = Comment.count
    post :create, comment: { body: "I'm a little teapot", link_id: @link.id, user_id: @user.id }
    assert @link.id, assigns(:comment).link_id
    assert @user.id, assigns(:comment).user_id
    assert_equal "I'm a little teapot", assigns(:comment).body
    assert_equal prev_comment_count + 1, Comment.count
  end

end
