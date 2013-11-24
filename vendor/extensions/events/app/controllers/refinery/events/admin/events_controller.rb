module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event',
                :xhr_paging => true

        before_filter :update_created_by, :only => [:create]
        before_filter :update_updated_by, :only => [:update]

        def index
          if current_user.roles.map(&:title).include?('Superuser')
            @events = Refinery::Events::Event.paginate(:page=>params[:page])
          else
            @events = Refinery::Events::Event.where(:created_by=>current_user.id).paginate(:page=>params[:page])
          end          
        end

        def venue
          @event = Refinery::Events::Event.find(params[:id])
          @venue = @event.venue.blank? ? Refinery::Events::Venue.new : @event.venue
        end

        def venue_info
          @event = Refinery::Events::Event.find(params[:id])
          unless @event.venue.blank?
            @event.venue.update_attributes(params[:venue])
          else
            params[:venue][:event_id] = @event.id
            Refinery::Events::Venue.create(params[:venue])
          end
          @venue = @event.venue
          redirect_to (:back)
        end

        def contact
          @event = Refinery::Events::Event.find(params[:id])
          @contact = @event.contact.blank? ? Refinery::Events::Contact.new : @event.contact
        end

        def contact_info
          @event = Refinery::Events::Event.find(params[:id])
          unless @event.contact.blank?
            @event.contact.update_attributes(params[:contact])
          else
            params[:contact][:event_id] = @event.id
            Refinery::Events::Contact.create(params[:contact])
          end
          @contact = @event.contact
          redirect_to (:back)
        end

        def publish
          @event = Refinery::Events::Event.find(params[:id])
          @event.update_attributes(:published => true)
          redirect_to '/refinery/events'
        end

        def revoke
          @event = Refinery::Events::Event.find(params[:id])
          @event.update_attributes(:published => false)
          redirect_to '/refinery/events'
        end

        def tickets
        end

        def update_created_by
          params[:event][:created_by] = current_user.id
        end

        def update_updated_by
          params[:event][:updated_by] = current_user.id
        end

      end
    end
  end
end