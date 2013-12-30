class Workspace < ActiveRecord::Base
  attr_accessible :category, :created_by, :description, :end_date, :partner_id, :position, :published, :published_by_eo, :schedule, :start_date, :sub_category, :terms_conditions, :title, :updated_by, :url, :banner, :thumbnail

  has_attached_file :banner,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
  
  has_attached_file :thumbnail,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  has_many :workspace_responses, :class_name => "WorkspaceResponse"
  belongs_to :partner, :class_name => "Refinery::Partner"
end
