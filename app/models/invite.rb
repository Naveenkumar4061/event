class Invite < ActiveRecord::Base
  attr_accessible :email

  validate :email, presence: true
  validate :email, uniqueness: true
end
