User.delete_all
Post.delete_all
Comment.delete_all

10.times do
  User.create(username: Faker::Internet.user_name, password: 123)
end


5.times do
  user_id_array = User.all.pluck(:id)
  post_user_id = user_id_array.sample
  user_id_array.delete(post_user_id)
  post = Post.create(title: Faker::Company.catch_phrase, body: Faker::Hacker.say_something_smart, user_id: post_user_id)
  rand(1..5).times do
    post.comments << Comment.create(body: Faker::Hacker.say_something_smart, user_id: user_id_array.sample)
  end
end


