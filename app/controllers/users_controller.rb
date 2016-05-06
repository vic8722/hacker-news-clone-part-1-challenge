get '/' do
  redirect '/login'
end

get '/login' do
  erb :'users/index'
end

post '/login' do
   @user = User.find_by_email(params[:email])
   if @user.authenticate(params[:password])
     session[:user_id] = @user.id
     session[:username] = @user.username
     redirect "/users/#{@user.id}"
   else
     redirect '/login'
   end
 end

 post '/logout' do
   session[:user_id] = nil
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

get '/users/:id' do
  @user = User.find(params[:id])
  @tweets = @user.tweets
  erb :'users/show'
end

get '/users/:id/edit' do
  if session[:user_id] == @user.id
    @user = User.find(params[:id])
    erb :'users/edit'
  else
    redirect '/login'
  end
end

put '/edit_user/:id' do
  user = User.find(params[:id])
  user.update(params[:user])
  redirect "/users/#{user.id}"
end

delete '/delete_account/:id' do
  if session[:user_id] == @user.id
    user = User.find(params[:id])
    user.destroy
    redirect '/login'
  else
    redirect '/login'
  end
end
