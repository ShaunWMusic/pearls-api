class ChargeResource < JSONAPI::Resource
  attributes :amount, :description, :currency, :source, :receipt_email

  before_save do
     # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        Stripe::Charge.create( :description => description, :source => source, :receipt_email => receipt_email, :amount => '1399', :currency => 'usd')
       @model.amount = '13.99'
       @model.currency = 'usd'
       @model.save
  end
end
