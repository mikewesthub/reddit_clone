class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :destroy, :update]

  def index
    @links = Link.order(created_at: :desc).page params[:page]
  end

  def new
    @link = Link.new
  end

  def show
    @comment = Comment.new(link_id: @link.id)
  end

  def edit
  end

  def destroy
    @link.destroy
    redirect_to individual_links_index_path
  end

  def update
    @link.update(link_params)
    redirect_to action: "show", id: @link.id
  end

  def create
    @link = current_user.links.create(link_params)
    redirect_to individual_links_index_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :description, :url, :user_id)
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
