class Refinery::Partner < ActiveRecord::Base
  attr_accessible :company_name, :employee_strength, :address

  validates :company_name, presence: true
  has_many :users, :class_name=>'User'
end
