class StaticController < ApplicationController
  layout 'splash'
  
  def home
    @user = User.new
    redirect_to '/event' if user_signed_in?
  end

  def contact_us
    render :layout=>'static'
  end

  def contactus
    @enq = Enquiry.create(params[:contact])
    #send_mail
    flash[:notice] = "We will be in touch with you soon!"
    redirect_to '/contact-us'
  end

  def faqs
    render :layout=>'static'
  end

  def privacy_policy
    render :layout=>'static'
  end

  def purchase_policy
    render :layout=>'static'
  end

end