class TrackingNumberMailer < ApplicationMailer


  def Tracking_number(sendtrackingnumber)
    @user = sendtrackingnumber
    # onetime = @user.receipt_email
    # subscriber = @user.email 
    mail to: @user.receipt_email,
         subject: "📦 Your Order Is On Its Way! 🛫"
  end

  def Tracking_numbercustomer(sendtrackingnumber)
    @user = sendtrackingnumber
    # onetime = @user.receipt_email
    # subscriber = @user.email 
    mail to: @user.email,
         subject: "📦 Your Order Is On Its Way! 🛫"
  end


end
