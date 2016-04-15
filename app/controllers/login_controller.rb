class LoginController < ApplicationController
  def new
    # @user = User.find(params[:id])
  end

  def create
    @user = User.find_by(user_name: user_params[:user_name])
    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      redirect_to links_index_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil if current_user
    redirect_to login_new_path
  end

  private

  def user_params
    params.permit(:user_name, :password)
  end
end
