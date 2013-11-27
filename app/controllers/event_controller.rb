class EventController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Refinery::Events::Event.where('start_date > ?', Time.now)
  end

  def show
    @event = Refinery::Events::Event.where(:url => params[:url]).first
  end

  def registration_step1    
    @event = Refinery::Events::Event.find(params[:id])
    registrations = current_user.registrations.where(:event_id=>params[:id],:state=>"cart")
    if registrations.blank?
      Refinery::Events::Registration.create(:event_id=>params[:id],:no_of_tickets => 0,:user_id=>current_user.id,:state=>'cart')
    else
    end
    tax_total = 0
    total = 0

    @registration = current_user.registrations.where(:event_id=>params[:id],:state=>'cart').last
    @registration.attendees.delete_all

    params[:ticket].each do |ticket|
      ticket_id = ticket[0]
      tick = Refinery::Events::Ticket.find(ticket_id)
      quantity = ticket[1].to_i
      price = tick.discounted_price.to_i
      if quantity.to_i !=0 && tick
        Refinery::Events::Attendee.create(:registration_id => @registration.id, :ticket_id => tick.id, :is_master => true)
        if tick.is_service_tax 
          tax_total += ((price * quantity) * tick.service_tax_percent)/100
          total += (price * quantity) + (((price * quantity) * tick.service_tax_percent)/100)
        else
          total += (price * quantity)
        end
      end
    end
    @registration.update_attributes(:no_of_tickets=>params[:ticket].values.map(&:to_i).sum, 
      :total=>total, 
      :discount=>0,
      :sales_tax=>tax_total,
      :event_id=>@event.id,
      :user_id=>current_user.id,
      :state=>'cart')


    redirect_to "/event/#{@event.id}/registration_step2"
  end

  def registration_step2
    @event = Refinery::Events::Event.find(params[:id])    
    @registration = current_user.registrations.where(:event_id=>@event.id,:state=>'cart').last
  end

  def attendee_details
    @event = Refinery::Events::Event.find(params[:id])    
    @registration = current_user.registrations.where(:event_id=>@event.id,:state=>'cart').last

    @registration.attendees.each do |a|
      params[:attendee_detail].each do |hsh|
        field_id = hsh[0]
        value = hsh[1]
        if value.class == Array
          value.each do |v|
            Refinery::Events::AttendeeDetail.new(:field_id=>field_id, :value=>value, :attendee_id=>a.id)              
          end
        else
          Refinery::Events::AttendeeDetail.new(:field_id=>field_id, :value=>value, :attendee_id=>a.id)
        end
      end
    end

    if @registration.update_attributes(:state=>'complete')  
      redirect_to '/'
    else
      render 'registration_step2'
    end
  end

  def booking_history
    @registrations = current_user.registrations.where(:state=>'complete')
  end

  def support_feedback
    #send mail to admin
    redirect_to '/event/support'

  end

end