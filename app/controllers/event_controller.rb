class EventController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:filter] == "all"
      @events = Refinery::Events::Event.where('start_date > ? and published = ?', Time.now,true)
    elsif params[:filter] == "today"
      @events = Refinery::Events::Event.where('start_date > ? and end_date < ? and published = ?', "#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}","#{Time.now.end_of_day.strftime('%Y-%m-%d %H:%M:%S')}",true)
    elsif params[:filter] == "tomorrow"
      @events = Refinery::Events::Event.where('start_date > ? and end_date < ? and published = ?', "#{(Time.now+1.day).beginning_of_day.strftime('%Y-%m-%d %H:%M:%S')}","#{(Time.now+1.day).end_of_day.strftime('%Y-%m-%d %H:%M:%S')}",true)
    elsif params[:filter] == "week"
      @events = Refinery::Events::Event.where('start_date > ? and end_date < ? and published = ?', "#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}","#{(Time.now+1.week).end_of_day.strftime('%Y-%m-%d %H:%M:%S')}",true)
    elsif params[:filter] == "month"
      @events = Refinery::Events::Event.where('start_date > ? and end_date < ? and published = ?', "#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}","#{(Time.now+1.month).end_of_day.strftime('%Y-%m-%d %H:%M:%S')}",true)      
    else
      @events = Refinery::Events::Event.where('start_date > ? and published = ?', Time.now,true)      
    end
      
  end

  def workspace
    @workspaces = Workspace.where(:partner_id=>current_user.partner_id)
  end

  def workspace_show
    @workspace = Workspace.find(params[:id])
  end

  def workspace_response
    @workspace = Workspace.find(params[:id])
    @workspace_response = WorkspaceResponse.where( :workspace_id => params[:id], :user_id => current_user.id ).try(:first)
      
    if current_user && params[:r] == "will_attend"
      if @workspace_response.blank?
        WorkspaceResponse.create(:user_id => current_user.id, :response => "Will Attend", :workspace_id => params[:id])
      else
        @workspace_response.update_attributes(:response => "Will Attend")
      end
    elsif current_user && params[:r] == "willnot_attend"
      if @workspace_response.blank?
        WorkspaceResponse.create(:user_id => current_user.id, :response => "Will Not Attend", :workspace_id => params[:id])
      else
        @workspace_response.update_attributes(:response => "Will Not Attend")
      end
    elsif current_user && params[:r] == "may_attend"
      if @workspace_response.blank?
        WorkspaceResponse.create(:user_id => current_user.id, :response => "May Attend", :workspace_id => params[:id])
      else
        @workspace_response.update_attributes(:response => "May Attend")
      end
    else  
    end
    redirect_to "/workspace/#{@workspace.id}"
  end

  def show
    @event = Refinery::Events::Event.where(:url => params[:url]).first
    act = Activity.where('event_id = ? and user_id = ?', @event.id, current_user.id)
    if act.blank?
      Activity.create(:event_id=>@event.id,:user_id=>current_user.id,:event_name=>@event.title,:viewed_at=>Time.now)
    else
      act.first.update_attributes(:viewed_at=>Time.now)
    end
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
    @registration.attendees.destroy_all

    params[:ticket].each do |ticket|
      ticket_id = ticket[0]
      tick = Refinery::Events::Ticket.find(ticket_id)
      quantity = ticket[1].to_i
      price = tick.discounted_price.to_i
      if quantity.to_i !=0 && tick
        quantity.times do |t|
          Refinery::Events::Attendee.create(:registration_id => @registration.id, :ticket_id => tick.id, :is_master => true)          
        end
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
    #raise params.inspect
    @event = Refinery::Events::Event.find(params[:id])    
    @registration = current_user.registrations.where(:event_id=>@event.id,:state=>'cart').last

    @registration.attendees.each do |a|
      params[:attendee_detail].each do |hsh|        
        field_id = hsh[0]
        value = hsh[1]
        if value.class == Array
          value.each do |v|
            Refinery::Events::AttendeeDetail.create(:field_id=>field_id, :value=>value, :attendee_id=>a.id)              
          end
        else
          Refinery::Events::AttendeeDetail.create(:field_id=>field_id, :value=>value, :attendee_id=>a.id)
        end
      end
    end

    if @registration.update_attributes(:state=>'cart')  
      @registration.update_tickets_sold
      redirect_to '/event/cart'
    else
      render 'registration_step2'
    end
  end

  def cart
    @registrations = current_user.registrations.where(:state=>'cart')
  end

  def checkout
    
    tot=Refinery::Events::Registration.find(params[:registration]).sum(&:total)
    #payment
    transaction = Transaction.create(:total=>tot,:user_id=>current_user.id,:state=>'complete')
    params[:registration].each do |rid|
      r=Refinery::Events::Registration.find(rid.to_i)
      r.update_attributes(:state=>'complete',:transaction_id=>transaction.id)
    end

    redirect_to :controller=>'event',:action=>'checkout_confirm', :id=>transaction.id
  end

  def checkout_confirm
    @transaction = current_user.transactions.where(:id=>params[:id]).try(:first)
  end

  def booking_history
    @registrations = current_user.registrations.where(:state=>'complete')
  end

  def view_registration
    @registration = Refinery::Events::Registration.find(params[:id])
  end

  def support_feedback
    #send mail to admin
    UserEnquirey.create(:email=>params[:from_email],:subject=>params[:subject],:category=>params[:category][:name],:subcategory=>params[:subcategory][:name],:description=>params[:message],:user_id=>current_user.id)
    EventMailer.support_email(params[:from_email],params[:subject],params[:message]).deliver
    flash[:notice] = "Will be in touch with you soon!"
    redirect_to '/event/support'

  end

end
