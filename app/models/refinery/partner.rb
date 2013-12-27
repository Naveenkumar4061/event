class Refinery::Partner < ActiveRecord::Base
  attr_accessible :company_name, :employee_strength, :address, :area, :city, :state, :email

  validates :company_name, presence: true
  has_many :users, :class_name=>'User'
  has_many :invites, :class_name=>'Invite'

  default_scope where('deleted_at is null')

  def delete
    self.update_attribute('deleted_at',Time.now)
  end
end
