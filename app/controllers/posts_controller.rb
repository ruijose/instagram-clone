class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.create
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def post_params  
    params.require(:post).permit(:image, :caption)
  end  
end
