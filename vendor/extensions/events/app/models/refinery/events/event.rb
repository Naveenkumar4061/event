module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'
      
      after_create :create_default_registration_from

      attr_accessible :title, :start_date, :end_date, :category, :sub_category, :url, :description, :position, :photo_id, :position, :created_by, :updated_by, :schedule, :terms_conditions, :published, :banner, :banner_file_name , :master_details_only, :only_master_attendee, :publish_banner, :published_by_eo, :banner_position, :end_time, :start_time, :censor_warning, :print_tickets, :parking_info

      attr_accessor :start_time, :end_time

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

      CATEGORIES = {
"Music" => ["Calls to Artists","Class/Workshop","Competition/Contest","Conference","Exhibition","Dance","Concert","Festival/Fair","Fundraiser","Lecture/Talk","Special Event","Theater","Film"],
"Art" => ["Arts Center","Call to Artists","Class/Workshop","Competition/Contest","Conference","Dance","Exhibition","Festival/Fair","Film","Fundraiser","Gallery","Food and Wine","Lecture/Talk","Literary Arts and Poetry","Meeting","Multicultural","Museum","Music","Open Studios Tour","Performing Arts","Historic","Special Event","Theatre","Trails and Corridors","Trips","Visual Arts","Walk","Photography"],
"Food and Wine" => ["Barbecue/Picnic","Class/Workshop","Competition/Contest","Conference","Festival/Fair","Fundraiser","Art","Lecture/Talk","Meeting","Multicultural","Museum","Slow Food","Special Event","Tours","Trails and Corridors","Wine/Beer Tasting","Winery"],
"Edutainment" => ["Class/Workshop","Competition/Contest","Trails and Corridors","Conference","Festival/Fair","Fundraiser","Public Meeting","Meeting","Special Event","Seminar"],
"Health and Wellness" => ["Art","Class/Workshop","Climbing","Competition/Contest","Conference","Cycling","Eye Check-up","Exercise","Exhibition","Festival/Fair","Film","Fitness","Fundraiser","Yoga","Hike","Kayak/Canoe","Walk","Lecture/Talk","Massage","Meditation","Meeting","Museum","Yoga","Parenting","Physical Therapy","Spiritual Theraphy","Special Event","Weekend Camp","Theater","Trails and  Corridors","Visitor Center","Dental Check-up","BMI Check-up","Skin & Hair Check-up"],
"Nature" => ["Class/Workshop","Competition/Contest","Festival/Fair","Fundraiser","Walk","Lecture/Talk","Meeting","Multicultural","Museum","Schools","Special Event","Theater","Trails and Corridors","Visitor Center","Hike","Wildflowers","Wildlife Festival","Wildlife Special Event","Wildlife Viewing","Conference","Photography"],
"Sports" => ["Class/Workshop","Car Tour/Show","Climbing","Competition/Contest","Conference","Cycling","Endurance Event","Equestrian","Exhibition","Festival/Fair","Film","Fundraiser","Hike/Walk","Kayak/Canoe","Sky Diving","Lecture/Talk","Marathon","Meeting","Motor Sport","Museum","Outdoor Activities","River Rafting","Health/Wellness","Special Event","Team Sports","Theater","Trails and Corridors","Triathlon","Visitor Center","Wildflowers","Wildlife Viewing"]
}

      SUP_CATEGORY = {"Registration/Sign In"=>["Can anyone register?","How do I register?","Why should I register?","Why do you need my mobile number?","How to reset password?"],	"Ticket Booking/Cancel"=>["How to book?","Can I book in advance?","Booking Fees?","How many tickets can i book?","Cut-off time for booking?","Age limit?","Did not receive booking confirmation?","Unsuccessful Booking?","Ticket Delivery?","Proof of Purchase?","Booking transferrable?","Cancel/replace booking?","Ticket Booking/Cancel"],	"Payment"=>["Modes of Payment?","Secure transaction?","What is a CVV code?","How do i get Verified by Visa - MasterCard Secure Code?"],	"Refunds"=>["Booking rejected but charged?","Refund incase of event cancellation?"]}
      
      def create_default_registration_from
        if self.form.blank?
          Refinery::Events::Form.create(:event_id => self.id)
        end
      end

      def master_details_only
        self.only_master_attendee        
      end

      def change_outlet_datatype
        ActiveRecord::Base.connection.execute('ALTER TABLE refinery_events_outlets ALTER COLUMN event_id TYPE integer USING (event_id::integer);')
      end

    end
  end
end
