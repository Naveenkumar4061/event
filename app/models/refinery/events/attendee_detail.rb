class Refinery::Events::AttendeeDetail < ActiveRecord::Base
  attr_accessible :field_id, :value, :attendee_id
  
  belongs_to :attendee, :class_name=>'::Refinery::Events::Attendee'

end
