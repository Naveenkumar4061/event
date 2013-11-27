class Refinery::BankDetail < ActiveRecord::Base
  attr_accessible :account_number, :account_name, :bank_name, :ifsc, :branch, :account_type, :user_id

  belongs_to :user
end
