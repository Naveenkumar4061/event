class Refinery::Events::Admin::ArtistsController < ::Refinery::AdminController

  def index
    @event = Refinery::Events::Event.includes(:artists).where('id=?',params[:event_id]).first
    @artists = @event.artists
  end

  def new
    @event = Refinery::Events::Event.find(params[:event_id])
    @artist = Refinery::Events::Artist.new
    render :new
  end

  def create    
    params[:artist][:event_id] = params[:event_id]
    @artist = Refinery::Events::Artist.new(params[:artist])
    @artist.save
    redirect_to "/refinery/events/#{params[:event_id]}/artists"
  end

  def edit
    @event = Refinery::Events::Event.find(params[:event_id])
    @artist = Refinery::Events::Artist.find(params[:id])
  end

  #def show
  #end

  def update
    @event = Refinery::Events::Event.find(params[:event_id])
    @artist = Refinery::Events::Artist.find(params[:id])
    @artist.update_attributes(params[:artist])
    redirect_to "/refinery/events/#{params[:event_id]}/artists"
  end

  def destroy
    @artist = Refinery::Events::Artist.find(params[:id])
    @artist.delete unless @artist.blank?
    redirect_to "/refinery/events/#{params[:event_id]}/artists"
  end

end