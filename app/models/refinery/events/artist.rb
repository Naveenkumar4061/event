class Refinery::Events::Artist < ActiveRecord::Base
  attr_accessible :artist, :description, :event_id

  belongs_to :event, :class_name => '::Refinery::Events::Event'
  has_attached_file :artist,
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
end