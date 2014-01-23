class Invite < ActiveRecord::Base
  attr_accessible :email, :partner_id

  validate :email, presence: true
  validate :email, uniqueness: true
  validate :partner_id, presence: true
  belongs_to :partner, :class_name => 'Refinery::Partner'
  has_many :gifts
end
