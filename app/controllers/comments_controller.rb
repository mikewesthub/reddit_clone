class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to comments_path
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to comments_path
  end

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :link_id, :user_id)
  end
end
