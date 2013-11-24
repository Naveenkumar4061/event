class Refinery::Events::Outlet < ActiveRecord::Base
  attr_accessible :outlet, :address, :timing, :event_id

  belongs_to :event, :class_name => '::Refinery::Events::Event'
end
