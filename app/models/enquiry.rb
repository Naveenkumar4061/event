class Enquiry < ActiveRecord::Base
  attr_accessible :category, :email, :message, :name, :sub_category, :telephone, :type_of_enq
end
