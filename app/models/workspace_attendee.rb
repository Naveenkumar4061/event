class WorkspaceAttendee < ActiveRecord::Base
  attr_accessible :attending, :maybe, :user_id, :wont_attend, :workspace_id
end
