class Comment < ActiveRecord::Base
  belongs_to :link, inverse_of: :comments
  belongs_to :user
  validates_presence_of :link
  validates :user_id, presence: true
  validates :link_id, presence: true
end
