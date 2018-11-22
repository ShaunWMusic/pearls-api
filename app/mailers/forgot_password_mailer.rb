class ForgotPasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
    # en.sign_up_mailer.Forgot_password.subject
  #
  def Forgot_password(new_password)
    @user = new_password
    mail to: @user.email,
         subject: "Reset Your Password | Pearl's Beard Oil"
  end
end
