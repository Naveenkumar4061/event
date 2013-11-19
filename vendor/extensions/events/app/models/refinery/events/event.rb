module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'
      
      after_create :create_default_registration_from

      attr_accessible :title, :start_date, :end_date, :category, :sub_category, :url, :description, :position, :photo_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
      has_one :venue, :class_name => '::Refinery::Events::Venue'
      has_one :contact, :class_name => '::Refinery::Events::Contact'
      has_many :tickets, :class_name => '::Refinery::Events::Ticket'
      has_one :form, :class_name => '::Refinery::Events::Form'
      
      def create_default_registration_from
        if self.form.blank?
          Refinery::Events::Form.create(:event_id => self.id)
        end
      end

    end
  end
end
