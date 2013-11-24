class Refinery::Events::Admin::OutletsController < ::Refinery::AdminController

  def index
    @event = Refinery::Events::Event.includes(:outlets).where('id=?',params[:event_id]).first
    @outlets = @event.outlets
  end

  def new
    @event = Refinery::Events::Event.find(params[:event_id])
    @outlet = Refinery::Events::Outlet.new
  end

  def create    
    params[:outlet][:event_id] = params[:event_id]
    @outlet = Refinery::Events::Outlet.new(params[:outlet])
    @outlet.save
    redirect_to "/refinery/events/#{params[:event_id]}/outlets"
  end

  def edit
    @event = Refinery::Events::Event.find(params[:event_id])
    @outlet = Refinery::Events::Outlet.find(params[:id])
  end

  #def show
  #end

  def update
    @event = Refinery::Events::Event.find(params[:event_id])
    @outlet = Refinery::Events::Outlet.find(params[:id])
    @outlet.update_attributes(params[:outlet])
    redirect_to "/refinery/events/#{params[:event_id]}/outlets"
  end

  def destroy
    @outlet = Refinery::Events::Outlet.find(params[:id])
    @outlet.delete unless @outlet.blank?
    redirect_to "/refinery/events/#{params[:event_id]}/outlets"
  end

end