class ApplicationController < ActionController::Base
  protect_from_forgery
  def refinery_user_required?
    false
  end
end
