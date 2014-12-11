class CommentsController < ApplicationController

  def index

  end

  def create
    
    redirect_to comments_path
  end
end
