class UserMailer < ApplicationMailer
  default from: "briansmont830@gmail.com"
  
  def new_user(user)
    @user = user
    mail(to: user.email, subject: "You have just joined the Blocipedia community!")
  end
end
