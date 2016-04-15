class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :password, confirmation: true
  has_many :links
  has_many :comments

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_hash = @password
  end
end
