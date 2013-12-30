class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:deactivate,:profile_update]

  def profile
    @user = current_user
  end

  def profile_update
    @user = current_user
    if @user && @user.update_attributes(params[:user])
      render :profile_update_confirmation,:layout => 'static'
    else
      render :profile
    end
  end

  def deactivate
    current_user.update_attribute('deleted_at',Time.now)
    render :deactivate, :layout => "static"
  end

end
