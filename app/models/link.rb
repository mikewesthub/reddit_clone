class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  validates :user_id, presence: true
  validates :title, presence: true
  validates :url, presence: true
end
