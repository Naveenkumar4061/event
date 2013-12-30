class WorkspaceResponse < ActiveRecord::Base
  attr_accessible :response, :user_id, :workspace_id

  belongs_to :workspace, :class_name => "Workspace"
  belongs_to :user, :class_name => 'User'
end
