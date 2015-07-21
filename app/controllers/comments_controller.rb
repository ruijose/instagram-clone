class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    redirect_to root_path if @post.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])  
    end

    def comment_params
      params.require(:comment).permit(:body, :author, :post_id)
    end
end
