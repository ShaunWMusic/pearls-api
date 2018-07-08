class UserMailer < ApplicationMailer
    default from: 'pearlsbeardoil@gmail.com'
 
  def welcome_email
    @user = params[:user]
    @url  = 'http://localhost/login'
    mail(to: @user.email, subject: 'Congrats! Welcome to the Club!')
  end
end
