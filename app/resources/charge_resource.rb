class ChargeResource < JSONAPI::Resource
  attributes :amount, :description, :currency, :source, :receipt_email, :tracking_number, :created_at, :updated_at

  before_save do
     # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        Stripe::Charge.create( :description => description, :source => source, :receipt_email => receipt_email, :amount => '1399', :currency => 'usd') if @model.new_record?
       @model.amount = '13.99'
       @model.currency = 'usd'
       sendtrackingnumber = @model if @model.tracking_number?
       mail = TrackingNumberMailer.Tracking_number(sendtrackingnumber) if @model.tracking_number?
       mail.deliver_now if @model.tracking_number?
       @model.save
  end
end
