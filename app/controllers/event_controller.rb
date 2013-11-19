class EventController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Refinery::Events::Event.all
  end

  def show
    @event = Refinery::Events::Event.find(params[:id])
  end

  def registration_step1
    @event = Refinery::Events::Event.find(params[:id])
    registrations = current_user.registrations.where(:event_id=>params[:id],:state=>"cart")
    if registrations.blank?
      Refinery::Events::Registration.create(:event_id=>params[:id],:no_of_tickets => params[:tot_no_tickets],:user_id=>current_user.id,:state=>'cart')
      # current_user.registrations.build(:event_id=>params[:id],:no_of_tickets => params[:tot_no_tickets])
    else
    end
    @registration = current_user.registrations.first
    @registration.attendees.delete_all
    params[:ticket].each do |id|
      id[1].to_i.times do
        Refinery::Events::Attendee.create(:ticket_id=>id[0].to_i,:registration_id=>@registration.id)
      end      
    end
    redirect_to "/event/#{@event.id}/registration_step2"
  end

  def registration_step2
    @event = Refinery::Events::Event.find(params[:id])
    @registration = current_user.registrations.where(:event_id=>@event.id,:state=>'cart').first

  end
end
