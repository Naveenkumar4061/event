class Refinery::Events::Admin::TicketsController < ::Refinery::AdminController
  
  def index
    @event = Refinery::Events::Event.includes(:tickets).where('id=?',params[:event_id]).first
    @tickets = @event.tickets
  end

  def new
    @event = Refinery::Events::Event.find(params[:event_id])
    @ticket = Refinery::Events::Ticket.new
  end

  def create    
    params[:ticket][:event_id] = params[:event_id]
    @ticket = Refinery::Events::Ticket.new(params[:ticket])
    @ticket.save
    redirect_to "/refinery/events/#{params[:event_id]}/tickets"
  end

  def edit
    @event = Refinery::Events::Event.find(params[:event_id])
    @ticket = Refinery::Events::Ticket.find(params[:id])
  end

  #def show
  #end

  def update
    @event = Refinery::Events::Event.find(params[:event_id])
    @ticket = Refinery::Events::Ticket.find(params[:id])
    @ticket.update_attributes(params[:ticket])
    redirect_to "/refinery/events/#{params[:event_id]}/tickets"
  end

  def destroy
    @ticket = Refinery::Events::Ticket.find(params[:id])
    @ticket.delete unless @ticket.blank?
    redirect_to "/refinery/events/#{params[:event_id]}/tickets"
  end
  
  def update_ticket_status
    @ticket = Refinery::Events::Ticket.find(params[:ticket_id])
    @ticket.update_attributes( :is_sold_out => params[:tickets_is_sold_out], :is_not_display => params[:tickets_is_not_display] )
    render :text => "success"
  end

end
