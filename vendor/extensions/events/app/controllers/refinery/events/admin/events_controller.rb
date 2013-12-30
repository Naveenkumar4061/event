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
              @events = Refinery::Events::Event.where('start_date < ?',Time.now.beginning_of_day.strftime('%Y-%m-%d %H:%M:%S')).paginate(:page => params[:page])
            else
              @events = Refinery::Events::Event.where('start_date < ? and created_by = ?',Time.now.beginning_of_day.strftime('%Y-%m-%d %H:%M:%S'), current_user.id).paginate(:page => params[:page])
            end
          else
            if current_user.roles.map(&:title).include?('Superuser')
              @events = Refinery::Events::Event.where('start_date > ?',Time.now.beginning_of_day.strftime('%Y-%m-%d %H:%M:%S')).paginate(:page => params[:page])
            else
              @events = Refinery::Events::Event.where('start_date > ? and created_by = ?',Time.now.beginning_of_day.strftime('%Y-%m-%d %H:%M:%S'), current_user.id).paginate(:page => params[:page])
            end
          end          
        end

        def schedule
          @event = Refinery::Events::Event.find(params[:id])
        end

        def save_schedule
          @event = Refinery::Events::Event.find(params[:id])

          if @event.update_attributes!(params[:event])
            render :schedule
          else
            render :schedule
          end
        end

        def parking_info
          @event = Refinery::Events::Event.find(params[:id])
        end

        def save_parking_info
          @event = Refinery::Events::Event.find(params[:id])

          if @event.update_attributes!(params[:event])
            render :parking_info
          else
            render :parking_info
          end
        end

        def terms
          @event = Refinery::Events::Event.find(params[:id])
        end

        def save_terms
          @event = Refinery::Events::Event.find(params[:id])

          if @event.update_attributes!(params[:event])
            render :terms
          else
            render :terms
          end
        end

        def venue
          @event = Refinery::Events::Event.find(params[:id])
          @venue = @event.venue.blank? ? Refinery::Events::Venue.new : @event.venue
        end

        def update_position
          @event = Refinery::Events::Event.find(params[:id])
          @event.update_attributes(:position=>params[:event_position])
          render :text=>"success"
        end

        def update_banner_position          
          @event = Refinery::Events::Event.find(params[:id])
          @event.update_attributes(:banner_position=>params[:event_banner_position])
          render :text=>"success"
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

        def venue_image
          @event = Refinery::Events::Event.find(params[:id])          
        end

        def venue_image_info          
          @event = Refinery::Events::Event.find(params[:id])          
          @event.update_attributes(params[:event])
          redirect_to "/refinery/events/#{@event.id}/venue_image"
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


        def users_report          
          start_date = params[:start][:date] unless params[:start].blank?
          end_date = params[:end][:date] unless params[:end].blank?
          event_organizers = params[:event][:organizer] unless params[:event].blank?
          event_ids = params[:event][:title] unless params[:event].blank?
          created_events = Refinery::Events::Event.where(:created_by=>current_user.id).map(&:id)

          if current_user.roles.map(&:title).include?('Superuser')
            #@users = User.where('created_at > ? and created_at < ?')
            if !event_ids.blank? #params[:event_id]
              @transctions = Refinery::Events::Registration.where(:state=>'complete',:event_id=>event_ids.split(','))
            else
              @transctions = Refinery::Events::Registration.where(:state=>'complete')
            end
          else
            if event_organizers#params[:event_id]
              @transctions = Refinery::Events::Registration.where('state= ? and event_id = ?','complete',event_organizers.blank? ? created_events : event_organizers.split(','))
            else
              @transctions = Refinery::Events::Registration.where('state= ? and event_id in (?)','complete',created_events)
            end
          end

          save_path = Rails.root.join('public',"User_Report_#{current_user.id}.csv")
          CSV.open(save_path,"wb") do |csv|
            csv << ["S.No", "Date", "Ticket Type", "Contact","Quantity","Amount"]
            count=1
            @transctions.each do |registration|              
              csv << [count, registration.created_at.strftime('%d/%m/%Y %H:%M:%S'), Refinery::Events::Ticket.find(registration.attendees.collect(&:ticket_id)).collect(&:ticket_name).join(',') ,registration.attendees.first.contact.values.join(',') , registration.no_of_tickets, registration.total ]
              count = count + 1
            end
          end
        end

        def event_organizers
          require 'json'
          if current_user.roles.map(&:title).include?('Superuser')
            @eos = User.unscoped.joins(:roles).where('roles.title=?','refinery').collect{|u| {:id=>u.id,:name=>u.email}}
          else
            @eos = [{:id=>current_user.id,:name=>current_user.email}]
          end
          @eos = @eos.to_json

          respond_to do |format|
            format.json {render json: @eos}
          end
        end

        def events_list
          require 'json'
          if current_user.roles.map(&:title).include?('Superuser')
            @events_list = Refinery::Events::Event.all.collect {|e| {:id => e.id,:name => e.title} }            
          else
            @events_list = Refinery::Events::Event.where(:created_by=>current_user.id).collect {|e| {:id => e.id,:name => e.title} }            
          end
          @events_list = @events_list.to_json

          respond_to do |format|
            format.json {render json: @events_list}
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

        def transaction_history          
          q=""
          state = params[:event].blank? ? "complete" : params[:event][:state]
          @state = state
          unless params[:start].blank?
            start_date = params[:start][:date].to_datetime.strftime('%Y-%m-%d %H:%M:%S')
            @startdate = params[:start][:date].to_datetime.strftime('%d/%m/%Y')
          else
            start_date = Time.now.beginning_of_day.strftime('%Y-%m-%d %H:%M:%S')
            @startdate = Time.now.beginning_of_day.strftime('%d/%m/%Y')
          end
          unless params[:end].blank?
            end_date = params[:end][:date].to_datetime.end_of_day.strftime('%Y-%m-%d %H:%M:%S')
            @enddate = params[:end][:date].to_datetime.end_of_day.strftime('%d/%m/%Y')
          else
            end_date = Time.now.end_of_day.strftime('%Y-%m-%d %H:%M:%S')
            @enddate = Time.now.beginning_of_day.strftime('%d/%m/%Y')
          end
          event_organizers = params[:event][:organizer] unless params[:event].blank?
          event_ids = params[:event][:title] unless params[:event].blank?
          created_events = Refinery::Events::Event.where(:created_by=>current_user.id).map(&:id)

          if current_user.roles.map(&:title).include?('Superuser')
            if !event_ids.blank? #params[:event_id]
              @transctions = Refinery::Events::Registration.where('state=? and event_id in (?) and created_at>? and created_at < ?',state,event_ids.split(','),start_date,end_date)
              @weekly = Refinery::Events::Registration.where('state=? and event_id in (?) and created_at>? and created_at < ?','complete',event_ids.split(','),(Time.now-1.week).beginning_of_day.strftime('%Y-%m-%d %H:%M:%S'),Time.now.end_of_day.strftime('%Y-%m-%d %H:%M:%S'))
              @revents = Refinery::Events::Event.find(event_ids.split(','))
            else
              @transctions = Refinery::Events::Registration.where('state=? and created_at > ? and created_at < ?',state,start_date,end_date)
              @weekly = Refinery::Events::Registration.where('state=? and created_at>? and created_at < ?','complete',(Time.now-1.week).beginning_of_day.strftime('%Y-%m-%d %H:%M:%S'),Time.now.end_of_day.strftime('%Y-%m-%d %H:%M:%S'))
              @revents = Refinery::Events::Event.all
            end
          else
            if event_organizers#params[:event_id]
              @transctions = Refinery::Events::Registration.where('state= ? and event_id = ? and created_at > ? and created_at < ?',state, (event_organizers.blank? ? created_events : event_organizers.split(',')), start_date, end_date )
              @weekly =  Refinery::Events::Registration.where('state= ? and event_id = ? and created_at > ? and created_at < ?','complete', (event_organizers.blank? ? created_events : event_organizers.split(',')),(Time.now-1.week).beginning_of_day.strftime('%Y-%m-%d %H:%M:%S'),Time.now.end_of_day.strftime('%Y-%m-%d %H:%M:%S'))
            else
              @transctions = Refinery::Events::Registration.where('state= ? and event_id in (?) and created_at > ? and created_at < ?',state,created_events,start_date,end_date)
              @weekly =  Refinery::Events::Registration.where('state= ? and event_id = ? and created_at > ? and created_at < ?','complete', (event_organizers.blank? ? created_events : event_organizers.split(',')),(Time.now-1.week).beginning_of_day.strftime('%Y-%m-%d %H:%M:%S'),Time.now.end_of_day.strftime('%Y-%m-%d %H:%M:%S'))
            end
            @revents = Refinery::Events::Event.find(event_organizers.blank? ? created_events : event_organizers.split(','))
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

      end
    end
  end
end
