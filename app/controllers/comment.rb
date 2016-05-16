get '/posts/:post_id/comments/new' do
  erb :'/comments/new'
end


post '/posts/:post_id/comments' do

  @comment = Comment.new(body: params["comment"], user_id: session[:id], post_id: params[:post_id])
  puts params[:post_id]

  if @comment.save
    redirect :"posts/#{params[:post_id]}"
  else
    erb :'/comments/new'
  end

end
