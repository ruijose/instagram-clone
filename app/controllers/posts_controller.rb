class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.followed_users_posts(current_user) + current_user.posts
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
    @post.comments.create(:body => @post.caption, :user_id => @post.user_id)
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
