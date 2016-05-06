class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :followings, :foreign_key => 'follower_id'

  # def followings
  #   Following.where(user_id: self.id)
  # end
  has_many :followers, through: :followings

  # def followers
  # self.followings.map { |following| following.followers }
  # end
  has_many :followed, through: :followings
  has_many :tweets_users
  has_many :tweets, through: :tweets_users

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end
