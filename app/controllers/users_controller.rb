get '/users/login' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

get '/user/profile' do
  erb :'users/show'
end

post '/users_new' do
  redirect '/users/login'
end

get '/user/:id/edit' do
  erb :'user/edit'
end

put '/user_id' do
  redirect '/user/profile'
end

delete 'users/:id' do
  redirect '/users/login'
end
