class UsersController < ApplicationController
  # def index
  # end
  def new
    @user = User.new
  end

  def show
    authenticate!
    @user = User.find(params[:id])
  end

  def edit
    authenticate!
    @user = User.find(params[:id])
  end

  def destroy #after creating login make sure destroy redirects to new login
    authenticate!
    User.find(params[:id]).destroy
    redirect_to action: "index"
  end

  def update
    authenticate!
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to action: "show", id: @user.id
  end

  def create
    @user = User.create(user_params)
    redirect_to action: "show", id: @user.id
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password_confirmation)
  end
end
