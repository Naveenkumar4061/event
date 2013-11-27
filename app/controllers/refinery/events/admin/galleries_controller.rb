class Refinery::Events::Admin::GalleriesController < ::Refinery::AdminController
  def index
    @event = Refinery::Events::Event.includes(:galleries).where('id=?',params[:event_id]).first
    @gallery = Refinery::Events::Gallery.new
    @galleries = @event.galleries
  end

  def new
    @event = Refinery::Events::Event.find(params[:event_id])
    @gallery = Refinery::Events::Gallery.new
    render :new
  end

  def create 
    unless params[:gallery].blank?   
      params[:gallery][:event_id] = params[:event_id]
      @gallery = Refinery::Events::Gallery.new(params[:gallery])
      @gallery.save
    end
    redirect_to "/refinery/events/#{params[:event_id]}/galleries"
  end

  def edit
  #  @event = Refinery::Events::Event.find(params[:event_id])
  #  @gallery = Refinery::Events::Gallery.find(params[:id])
  end

  #def show
  #end

  def update
    
  end

  def destroy
    @gallery = Refinery::Events::Gallery.find(params[:id])
    @gallery.delete unless @gallery.blank?
    redirect_to "/refinery/events/#{params[:event_id]}/galleries"
  end
end