class PostsController < ApplicationController
  def new
    @post = Post.new(author: session[:author])
  end

  def create
    @post = Post.new(post_params)
     if @post.save 
    session[:author] = @post.author
    flash[:notice] = "Post dodany!"
    redirect_to posts_path
     else 
      render action: 'new'
     end
     
   end 

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post zaktualizowany"
      redirect_to posts_path
    else
      render action: 'edit'
    end
  end

  def destroy
  end

  def edit
    @post = Post.find(params[:id])
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
