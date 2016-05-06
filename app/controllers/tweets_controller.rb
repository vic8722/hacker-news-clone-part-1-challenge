get '/users/:user_id/tweets' do
  erb :'tweets/index'
end

post '/users/:user_id/tweets/new' do
  @user = User.find(params[:user_id])
  @tweet = Tweet.create(description: params[:tweet])
  user_tweet = TweetsUser.find_by(tweet_id: @tweet.id)
  user_tweet.update(user_id: params[:user_id])

  redirect "/users/#{@user.id}"
end

get '/users/:user_id/tweets/show' do
  erb :'tweets/show'
end

get '/users/:user_id/tweets/edit' do
  erb :'tweets/edit'
end

put '/tweet_id' do
  redirect '/users/:user_id/tweets/show'
end

delete 'tweets/:id' do
  redirect 'tweets/index'
end

