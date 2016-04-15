class Link < ActiveRecord::Base
  belongs_to :user

  def verify
    unless current_user
      redirect_to login_path
    end
  end
end
