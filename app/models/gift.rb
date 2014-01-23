class Gift < ActiveRecord::Base
  attr_accessible :invite_id, :user_id, :registration_id, :attendee_id, :ticket_id, :event_id, :gifted_by, :accepted
  belongs_to :user
  belongs_to :invite
  belongs_to :event, :class_name=>'Refinery::Events::Event'
end
