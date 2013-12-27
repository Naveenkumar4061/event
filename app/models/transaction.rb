class Transaction < ActiveRecord::Base
  attr_accessible :response, :state, :total, :user_id
end
