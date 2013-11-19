class StaticController < ApplicationController
  layout 'splash'
  
  def home
    redirect_to '/event' if user_signed_in?
  end
end
