class Refinery::Events::Venue < ActiveRecord::Base
  attr_accessible :venue, :country, :state, :city, :locality, :pincode, :event_id

  belongs_to :event, :class_name => 'Refinery::Events::Event'
end
