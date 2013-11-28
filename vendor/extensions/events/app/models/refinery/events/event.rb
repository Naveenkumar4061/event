module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'
      
      after_create :create_default_registration_from

      attr_accessible :title, :start_date, :end_date, :category, :sub_category, :url, :description, :position, :photo_id, :position, :created_by, :updated_by, :schedule, :terms_conditions, :published, :banner, :banner_file_name , :master_details_only

      has_attached_file :banner,
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

#      has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

      validates :title, :presence => true, :uniqueness => true
      validates :url, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
      has_one :venue, :class_name => '::Refinery::Events::Venue'
      has_one :contact, :class_name => '::Refinery::Events::Contact'
      has_many :tickets, :class_name => '::Refinery::Events::Ticket'
      has_many :outlets, :class_name => '::Refinery::Events::Outlet'
      has_many :artists, :class_name => '::Refinery::Events::Artist'
      has_many :galleries, :class_name => '::Refinery::Events::Gallery'
      has_many :faqs, :class_name => '::Refinery::Events::Faq'
      has_one :form, :class_name => '::Refinery::Events::Form'
      has_many :registrations, :class_name => '::Refinery::Events::Registration'
      
      def create_default_registration_from
        if self.form.blank?
          Refinery::Events::Form.create(:event_id => self.id)
        end
      end

      def master_details_only
        true
      end

    end
  end
end
