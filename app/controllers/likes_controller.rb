class LikesController < ApplicationController
  def create
    @post = Post.find(params[:like][:liked_pics_id])
    current_user.like(@post)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render :file => "likes/toggle.js.erb" }
    end
  end

  def destroy
    like = Like.find(params[:id])
    @post = Post.find(like.liked_pics_id) 
    like.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render :file => "likes/toggle.js.erb" }
    end
  end
end
