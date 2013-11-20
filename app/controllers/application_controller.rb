class ApplicationController < ActionController::Base
  protect_from_forgery
  def refinery_user_required?
    false
  end

  protected
  
  def authenticate_inviter!
    nil
  end 

  def has_invitations_left?
    true
  end

end
