module Refinery
  module Admin
    class BankDetailsController < Refinery::AdminController
      
    	def index

        ids = RolesUsers.where(:role_id=>1).collect(&:user_id) - RolesUsers.where(:role_id=>2).collect(&:user_id)
        @event_organizers = User.find(ids)
    	end


    end
  end
end
