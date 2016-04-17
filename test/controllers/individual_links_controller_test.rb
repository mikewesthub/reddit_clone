require 'test_helper'

class IndividualLinksControllerTest < ActionController::TestCase
  setup do
    @user = users(:user_zero)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
