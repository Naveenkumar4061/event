class Transaction < ActiveRecord::Base
  attr_accessible :response, :state, :total, :user_id

  belongs_to :user, :class_name=>'User'
  has_many :registrations, :class_name=>'Refinery::Events::Registration'
end
