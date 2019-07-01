class NewAccountMailer < ApplicationMailer
 def New_account(new_account)
    @user = new_account
    mail to: @user.email,
         bcc: "shaun@pearlsbeardoil.com",
         subject: "🎊Welcome to the Club!👏"
  end
end
