class NewAccountMailer < ApplicationMailer
 def New_account(new_account)
    @user = new_account
    mail to: @user.email,
         subject: "🎊Welcome to the Club!👏"
  end
end
