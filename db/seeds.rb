50.times do
  new_user = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Hipster.word)
  new_tweet = Tweet.create(description: Faker::Hipster.sentence)
  new_user_2 = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Hipster.word)
  TweetsUser.create(tweet_id: new_tweet.id, user_id: new_user.id)
  Following.create(follower_id: new_user.id, followed_id: new_user_2.id)
end
