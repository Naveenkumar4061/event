class Refinery::Events::FormField < ActiveRecord::Base
  attr_accessible :field_name, :field_type, :is_mandatory, :form_id, :sequence_no, :deleted_at

  belongs_to :form, :class_name => '::Refinery::Events::Form'
  has_many :form_field_options, :class_name => '::Refinery::Events::FormFieldOption'
  has_many :attendee_details, :class_name => '::Refinery::Events::AttendeeDetail', :foreign_key=>:field_id
  
  default_scope { where deleted_at: nil }

  def delete
    self.update_attribute('deleted_at',Time.now)
  end
end
