get '/users/:user_id/tweets' do
  erb :'tweets/index'
end

get '/users/:user_id/tweets/new' do
  erb :'tweets/new'
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

