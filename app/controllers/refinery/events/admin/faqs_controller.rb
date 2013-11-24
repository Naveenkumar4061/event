class Refinery::Events::Admin::FaqsController < ::Refinery::AdminController

  def index
    @event = Refinery::Events::Event.includes(:faqs).where('id=?',params[:event_id]).first
    @faqs = @event.faqs
  end

  def new
    @event = Refinery::Events::Event.find(params[:event_id])
    @faq = Refinery::Events::Faq.new
  end

  def create    
    params[:faq][:event_id] = params[:event_id]
    @faq = Refinery::Events::Faq.new(params[:faq])
    @faq.save
    redirect_to "/refinery/events/#{params[:event_id]}/faqs"
  end

  def edit
    @event = Refinery::Events::Event.find(params[:event_id])
    @faq = Refinery::Events::Faq.find(params[:id])
  end

  #def show
  #end

  def update
    @event = Refinery::Events::Event.find(params[:event_id])
    @faq = Refinery::Events::Faq.find(params[:id])
    @faq.update_attributes(params[:faq])
    redirect_to "/refinery/events/#{params[:event_id]}/faqs"
  end

  def destroy
    @faq = Refinery::Events::Faq.find(params[:id])
    @faq.delete unless @faq.blank?
    redirect_to "/refinery/events/#{params[:event_id]}/faqs"
  end

end