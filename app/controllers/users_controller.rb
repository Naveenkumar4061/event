class UsersController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = current_user
  end

  def profile_update
    @user = current_user
    if @user && @user.update_attributes(params[:user])
      redirect_to :profile
    else
      render :profile
    end
  end

  def deactivate
    current_user.update_attribute('deleted_at',Time.now)
    redirect_to '/'
  end

end
