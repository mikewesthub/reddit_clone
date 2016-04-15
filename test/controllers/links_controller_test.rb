require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    @link = links(:tacocat)
    get :show, id: @link.id
    assert_response :success
  end

  test "should get edit" do
    @link = links(:tacocat)
    get :edit, id: @link.id
    assert_response :success
  end

  test "should get delete" do
    @link = links(:tacocat)
    link_count = Link.count
    delete :destroy, id: @link.id
    assert_redirected_to controller: "links", action: "index"
    assert_equal link_count - 1, Link.count
  end

  test "should get update" do
    @link = links(:tacocat)
    patch :update, id: @link.id, link: { description: "Feminist skinhead punk band from Portland"}
    assert_redirected_to controller: "links", action: "show", id: @link.id
    assert_equal "Feminist skinhead punk band from Portland", assigns(:link).description
  end

  test "should get create" do
    @user = users(:user_zero)
    session[:user_id] = @user.id
    prev_link_count = Link.count
    post :create, link: { title: "Over 9000", description: "Vegeta gets a huge surprise", url: "http://www.dbz.com", user_id: @user }
    assert assigns(:link).valid?
    assert_equal "http://www.dbz.com", assigns(:link).url
    assert_equal prev_link_count + 1, Link.count
  end

end
