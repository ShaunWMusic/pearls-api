class UnsubscribeMailer < ApplicationMailer
  def Cancel_account(cancel_account)
    @email = cancel_account
    mail to: @email,
         subject: "🙁Goodbye From Pearl's Beard Oil Club!👋"
  end
end
