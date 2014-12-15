class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to my_account_path
    end
  end

  def edit
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to tools_path
    else
      render :edit
    end
  end

  private

  def tool_params
    (params.require(:tool).permit(:name, :user_id))
  end

end
