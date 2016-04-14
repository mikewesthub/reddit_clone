class LoginController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(user_name: user_params[:user_name])
    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      redirect_to user_path
    else
      render :new
    end
  end

  def destroy
  end

  def user_params
    params.permit(:user_name, :password, :email)
  end
end
