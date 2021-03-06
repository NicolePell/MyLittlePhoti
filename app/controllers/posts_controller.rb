class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:name, :image)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Confound these ponies! Your post is destroyed."
    redirect_to '/posts'
  end

end
