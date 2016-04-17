class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  validates :user_id, presence: true
end
