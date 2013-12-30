class Refinery::Events::Admin::RestaurantsController < ::Refinery::AdminController

  def index
    @event = Refinery::Events::Event.includes(:restaurants).where('id=?',params[:event_id]).first
    @restaurants = @event.restaurants
  end

  def new
    @event = Refinery::Events::Event.find(params[:event_id])
    @restaurant = Refinery::Events::Restaurant.new
    render :new
  end

  def create    
    params[:restaurant][:event_id] = params[:event_id]
    @restaurant = Refinery::Events::Restaurant.new(params[:restaurant])
    @restaurant.save
    redirect_to "/refinery/events/#{params[:event_id]}/restaurants"
  end

  def edit
    @event = Refinery::Events::Event.find(params[:event_id])
    @restaurant = Refinery::Events::Restaurant.find(params[:id])
  end

  #def show
  #end

  def update
    @event = Refinery::Events::Event.find(params[:event_id])
    @restaurant = Refinery::Events::Restaurant.find(params[:id])
    @restaurant.update_attributes(params[:restaurant])
    redirect_to "/refinery/events/#{params[:event_id]}/restaurants"
  end

  def destroy
    @restaurant = Refinery::Events::Restaurant.find(params[:id])
    @restaurant.delete unless @restaurant.blank?
    redirect_to "/refinery/events/#{params[:event_id]}/restaurants"
  end

end