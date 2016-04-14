class UsersController < ApplicationController
  # def index
  # end
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy #after creating login make sure destroy redirects to new login
    User.find(params[:id]).destroy
    redirect_to action: "index"
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to action: "show", id: @user.id
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email)
  end
end
