class UserEnquirey < ActiveRecord::Base
  attr_accessible :category, :description, :email, :subcategory, :subject, :user_id
end
