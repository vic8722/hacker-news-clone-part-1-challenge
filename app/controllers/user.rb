get '/users/new' do
  erb :'users/new'
end

post '/users' do
  register
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  login
end

get '/users/logout' do
  logout
  redirect :'/'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end



