class PostsController < ApplicationController

  #def new
    #@post = Post.new
  #end

  def create
    @post = Post.create(title: "params[:title]", content: "params[:content]")
    raise

  end
end
