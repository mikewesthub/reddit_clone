class IndividualLinksController < ApplicationController
  def index
    @links = Link.where(user_id: current_user.id)
  end
end
