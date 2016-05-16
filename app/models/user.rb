require 'bcrypt'

class User < ActiveRecord::Base
  has_many  :posts
  has_many  :comments

  validates :username, uniqueness: true, presence: true
  validates :hashed_password, presence: true
  # users.hashed_password in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end
end
