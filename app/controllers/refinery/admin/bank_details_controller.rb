module Refinery
  module Admin
    class BankDetailsController < Refinery::AdminController
      
    	def index
        ids = RolesUsers.where(:role_id=>1).collect(&:user_id) - RolesUsers.where(:role_id=>2).collect(&:user_id)
        @event_organizers = User.find(ids)
    	end

      def details
        @event_organizer = User.find(params[:id])
        unless @event_organizer.blank?
          @events = Refinery::Events::Event.where(:created_by => @event_organizer.id)
        end
      end
    end
  end
end
