class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets, through: :tweet_users
end
