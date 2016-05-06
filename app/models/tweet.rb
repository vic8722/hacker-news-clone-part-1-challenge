class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets_users
  has_many :users, through: :tweets_users
end
