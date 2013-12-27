class Refinery::Events::Attendee < ActiveRecord::Base
  attr_accessible :registration_id,:ticket_id,:is_master

  belongs_to :registration, :class_name => '::Refinery::Events::Registration'
  has_many :attendee_details, :class_name => '::Refinery::Events::AttendeeDetail'
  belongs_to :ticket, :class_name => '::Refinery::Events::Ticket'

  def contact
    h = {}
    self.attendee_details.each do |details|
      if details.form_field.try(:field_name) == 'Full Name'
        h[:full_name] = details.value
      elsif details.form_field.try(:field_name) == 'Email Id'
        h[:email] = details.value
      elsif details.form_field.try(:field_name) == 'Mobile Number'
        h[:mobile] = details.value
      else
      end
    end
    h
  end
end
