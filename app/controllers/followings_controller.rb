get '/users/:user_id/followers' do
  erb :'followers/index'
end

get '/users/:user_id/following' do
  erb :'followers/following'
end

