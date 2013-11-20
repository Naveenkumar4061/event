class StaticController < ApplicationController
  layout 'splash'
  
  def home
    @user = User.new
    redirect_to '/event' if user_signed_in?
  end
end
