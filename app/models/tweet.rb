class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users, through: :tweet_users
end
