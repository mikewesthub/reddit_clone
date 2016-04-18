class IndividualCommentsController < ApplicationController
  def index
    @comments = Comment.where(user_id: current_user.id)
  end
end
