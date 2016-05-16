get '/' do
  @posts = Post.all
  erb :'index'
end

get '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  erb :'posts/show'
end
