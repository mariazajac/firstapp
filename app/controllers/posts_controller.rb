class PostsController < ApplicationController
  def new
    @post = Post.new(author: session[:author])
  end

  def create
    @post = Post.new(post_params)
    @post.save 
    session[:author] = @post.author
    flash[:notice] = "Post dodany!"
    redirect_to posts_path

   end 

  def update
  end

  def destroy
  end

  def edit
  end

  def index
     @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
   params.require(:post).permit(:title, :author, :body, :published)
  end
end
