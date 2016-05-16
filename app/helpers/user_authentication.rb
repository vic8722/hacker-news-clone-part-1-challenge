def login

    @user = User.find_by(username: params["user"]["username"])
      if @user && @user.password == params["user"]["password"]
        session[:id] = @user.id
        redirect :"users/#{@user.id}"
      else
        @errors = []
          if @user
            @errors << "Password is incorrect"
          else
            @errors << "Username #{params["user"]["username"]} doesn't exist."
          end
        erb :'users/login'
      end

end

def register

  @user = User.new(params["user"])

  if @user.save
    redirect :"users/#{@user.id}"
  else
    erb :'users/new'
  end

end

def logout
  session.clear
end

def current_user
  User.find_by(id: session[:id])
end
