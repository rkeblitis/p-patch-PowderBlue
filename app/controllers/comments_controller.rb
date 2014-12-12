class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def create
    #@post = Post.find(params[:id])
    @comment = Comment.create(params.require(:comment).permit(:comment, :post_id))

    redirect_to post_path
  end

  def show

  end

end
