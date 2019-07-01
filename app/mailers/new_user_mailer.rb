class NewUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
    # en.sign_up_mailer.Forgot_password.subject
  #
  def New_user(new_user)
    @user = new_user
    mail to: @user.email,
         bcc: "shaun@pearlsbeardoil.com",    
         subject: "Your Pearls Beard Oil receipt"
  end


# For password reset
#   def Forgot_password(new_password)
#     @user = new_password
#     mail to: @user.email,
#          subject: "Reset Your Password | SR Incentives"
#   end
end
