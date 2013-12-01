module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event',
                :xhr_paging => true

        before_filter :update_created_by, :only => [:create]
        before_filter :update_updated_by, :only => [:update]
        require 'csv'

        def index
          if params[:filter] == "past"
            if current_user.roles.map(&:title).include?('Superuser')              
              @events = Refinery::Events::Event.where('start_date < ?',Time.now.strftime('%Y-%m-%d %H:%M:%S')).paginate(:page => params[:page])
            else
              @events = Refinery::Events::Event.where('start_date < ? and created_by = ?',Time.now.strftime('%Y-%m-%d %H:%M:%S'), current_user.id).paginate(:page => params[:page])
            end
          else
            if current_user.roles.map(&:title).include?('Superuser')
              @events = Refinery::Events::Event.where('start_date > ?',Time.now.strftime('%Y-%m-%d %H:%M:%S')).paginate(:page => params[:page])
            else
              @events = Refinery::Events::Event.where('start_date > ? and created_by = ?',Time.now.strftime('%Y-%m-%d %H:%M:%S'), current_user.id).paginate(:page => params[:page])
            end
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
          if !current_user.roles.map(&:title).include?('Superuser')
            @event.update_attribute('published_by_eo',true)
          else            
            @event.update_attributes(:published => true)
          end
          #send Email
          redirect_to '/refinery/events'
        end

        def revoke
          @event = Refinery::Events::Event.find(params[:id])
          if !current_user.roles.map(&:title).include?('Superuser')
            @event.update_attribute('published_by_eo',false)
          else
            @event.update_attributes(:published => false)
          end
          #send Email
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

        def transaction_history          
          if current_user.roles.map(&:title).include?('Superuser')
            if params[:event_id]
              @transctions = Refinery::Events::Registration.where(:state=>'complete',:event_id=>params[:event_id])
            else
              @transctions = Refinery::Events::Registration.where(:state=>'complete')
            end
          else
            created_events = Refinery::Events::Event.where(:created_by=>current_user.id).map(&:id)
            if params[:event_id]
              @transctions = Refinery::Events::Registration.where('state= ? and event_id = ?','complete',params[:event_id])
            else
              @transctions = Refinery::Events::Registration.where('state= ? and event_id in (?)','complete',created_events)
            end
          end

          save_path = Rails.root.join('public',"Report_#{current_user.id}.csv")
          CSV.open(save_path,"wb") do |csv|
            csv << ["S.No", "Date", "Ticket Type", "Contact","Quantity","Amount"]
            count=1
            @transctions.each do |registration|              
              csv << [count, registration.created_at.strftime('%d/%m/%Y %H:%M:%S'), Refinery::Events::Ticket.find(registration.attendees.collect(&:ticket_id)).collect(&:ticket_name).join(',') ,registration.attendees.first.contact.values.join(',') , registration.no_of_tickets, registration.total ]
              count = count + 1
            end
          end
        end

        def bank_detail
          @bank_detail = current_user.bank_detail.blank? ? Refinery::BankDetail.new : current_user.bank_detail 
        end

        def update_bank_detail          
          @bank_detail = current_user.bank_detail
          if @bank_detail.blank?
            params[:bank_detail][:user_id] = current_user.id
            Refinery::BankDetail.create(params[:bank_detail])            
          else
            @bank_detail.update_attributes(params[:bank_detail])
          end
          redirect_to '/refinery/bank_details'
        end

      end
    end
  end
end
