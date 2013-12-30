class Refinery::Events::Restaurant < ActiveRecord::Base
  attr_accessible :name, :restaurant_image, :address_line1, :address_line2, :phone, :distance, :event_id

  belongs_to :event, :class_name => '::Refinery::Events::Event'

  has_attached_file :restaurant_image,
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

end