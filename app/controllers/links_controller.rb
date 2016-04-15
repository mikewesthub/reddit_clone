class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def destroy
    @link = Link.find(params[:id]).destroy
    redirect_to links_path
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    redirect_to action: "show", id: @link.id
  end

  def create
    @link = current_user.links.create(link_params)
    redirect_to action: "show", id: @link.id
  end

  private

  def link_params
    params.require(:link).permit(:title, :description, :url, :user_id)
  end
end
