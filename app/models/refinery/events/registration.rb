class Refinery::Events::Registration < ActiveRecord::Base
  attr_accessible :no_of_tickets, :total, :discount, :sales_tax, :adjustment, :event_id, :user_id, :state

  belongs_to :user
  has_many :attendees, :class_name => '::Refinery::Events::Attendee'
end
