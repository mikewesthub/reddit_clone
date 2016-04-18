class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  validates :link, presence: true
  validates :user_id, presence: true
  validates :link_id, presence: true
end
