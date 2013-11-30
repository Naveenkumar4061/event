class Refinery::Events::AttendeeDetail < ActiveRecord::Base
  attr_accessible :field_id, :value, :attendee_id
  
  belongs_to :attendee, :class_name=>'::Refinery::Events::Attendee'
  belongs_to :form_field, :class_name => '::Refinery::Events::FormField', :foreign_key=>:field_id
end
