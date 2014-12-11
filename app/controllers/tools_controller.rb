class ToolsController < ApplicationController

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to admin_path
    end
  end

  private

  def tool_params
    (params.require(:tool).permit(:name))
  end

end
