get '/' do
  redirect '/login'
end

get '/login' do
  erb :'users/index'
end

post '/login' do
   @user = User.find_by_email(params[:email])
   if @user.authenticate(params[:password])
     session[:id] = @user.id
     session[:username] = @user.username
     redirect '/users/show'
   else
     redirect '/'
   end
 end

 post '/logout' do
   session[:id] = nil
   redirect '/'
 end

post '/create_user' do
   unless User.find_by_email(params[:user['email']])
     @user = User.new(params[:user])
     @user.password = params[:password]
     @user.save
   end
   redirect '/login'
 end

get '/register' do
  erb :'users/new'
end

get '/user/profile' do
   if session[:id]
     erb :'users/show'
   else
     redirect '/login'
   end
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
