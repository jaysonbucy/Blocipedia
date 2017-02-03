class ApplicationMailer < ActionMailer::Base
  default from: 'jayson.h.b@gmail.com'
  default cc: 'alexstophel@gmail.com'

  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Your account for Blocipedia has been created.")
  end
end
