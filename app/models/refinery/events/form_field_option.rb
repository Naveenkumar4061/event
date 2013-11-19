class Refinery::Events::FormFieldOption < ActiveRecord::Base
  attr_accessible :form_field_id, :value

  belongs_to :form_field, :class_name => '::Refinery::Events::FormField'

end
