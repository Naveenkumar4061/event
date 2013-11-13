module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :start_date, :end_date, :category, :sub_category, :url, :description, :position, :photo_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
      has_one :venue, :class_name => '::Refinery::Events::Venue'
      has_one :contact, :class_name => '::Refinery::Events::Contact'

    end
  end
end
