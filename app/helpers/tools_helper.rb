module ToolsHelper

  def find_user_by_tool(tool_id)
    @user = User.find_by(id: tool_id)
  end
end
