class Refinery::Events::Attendee < ActiveRecord::Base
  attr_accessible :registration_id,:ticket_id,:is_master

  belongs_to :registration, :class_name => '::Refinery::Events::Registration'
  has_many :attendee_details, :class_name => '::Refinery::Events::AttendeeDetail'
  belongs_to :ticket, :class_name => '::Refinery::Events::Ticket'
end
