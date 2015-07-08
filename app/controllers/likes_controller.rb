class LikesController < ApplicationController
  def create
    @post = Post.find(params[:like][:liked_pics_id])
    current_user.like(@post)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    like = Like.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
