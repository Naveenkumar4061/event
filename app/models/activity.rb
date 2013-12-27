class Activity < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :viewed_at, :event_name
end
