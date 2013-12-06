class EventMailer < ActionMailer::Base
  default from: "admin@goevents.com"

  def support_email(email,subject ,message )
    @message = message
    @email = email
    mail(from: email,to: "naveenkumar4061@gmail.com",subject: subject)
  end
end
