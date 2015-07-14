class LikesController < ApplicationController
  def create
    @post = Post.find(params[:like][:liked_pics_id])
    current_user.like(@post)
    redirect_to root_path
  end

  def destroy
    like = Like.find(params[:id])
    @post = Post.find(like.liked_pics_id) 
    like.destroy
    redirect_to root_path
  end
end
