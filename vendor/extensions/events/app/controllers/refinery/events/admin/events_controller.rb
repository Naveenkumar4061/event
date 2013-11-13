module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event',
                :xhr_paging => true
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

      end
    end
  end
end
