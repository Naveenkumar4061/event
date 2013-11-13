class Refinery::Events::Contact < ActiveRecord::Base
  attr_accessible :name, :emailids, :website_url, :facebook_link, :event_id
  
  belongs_to :event, :class_name => 'Refinery::Events::Event'
end
