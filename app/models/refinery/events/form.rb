class Refinery::Events::Form < ActiveRecord::Base
  attr_accessible :event_id
  after_create :create_default_form_fields
  
  belongs_to :event, :class_name => '::Refinery::Events::Event'
  has_many :form_fields, :class_name => '::Refinery::Events::FormField'

  def create_default_form_fields
    if self.form_fields.blank?
      fields = {:"Full Name" => 'textbox', :"Email Id" => 'textbox', :"Mobile Number" => 'textbox'}
      fields.each do |field|
        if field[1].to_s == 'textbox' || field[1].to_s == 'textarea'
          Refinery::Events::FormField.create(:field_name => field[0].to_s, :field_type => field[1].to_s, :is_mandatory => 1,:form_id => self.id)
        else
          #TODO add options for default state, city, designation
          
          form_field = Refinery::Events::FormField.create(:field_name => field[0].to_s, :field_type => field[1].to_s, :is_mandatory => 1,:form_id => self.id)
          #form_field_option = FormFieldOption.create(:form_field_id => form_field.id, :value => )
        end
      end
    end
  end
end
