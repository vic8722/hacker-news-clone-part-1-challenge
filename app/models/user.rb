class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :tweets, through: :tweet_users

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
