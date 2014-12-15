class PostsController < ApplicationController

  def create
    @post = Post.create(params.require(:post).permit(:title, :content))
    if @post.save
      NewsMailer.news_update(@post.id).deliver
      redirect_to my_account_path
    else
      redirect_to admin_path
    end
  end


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

end
