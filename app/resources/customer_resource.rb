require "stripe"

class CustomerResource < JSONAPI::Resource
  attributes :account_balance, :business_vat_id, :coupon, :default_source, :description, :email, :invoice_prefix, :metadata, :shipping, :source, :token, :card
   before_save do
        stripe = Stripe.api_key = ENV['SECRET_TEST_KEY']
        # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        
        token = @model.token
        create_customer =  Stripe::Customer.create( :description => "Customer for Pearls Beard Oil", :source => token, :email => email )
        @model.source = create_customer.id
        email = @model.token
        email = @model.email
        plan = Plan.new
        plan.email = email
        plan.save
        
        # binding.pry
        @model.save
        # plan.email = email
        # customer_id = create_customer.id
        # plan = Stripe::Plan.retrieve("Sandy-Cheeks")
        # Stripe::Subscription.create( :customer => customer_id, :items => [{ :plan => plan.id,},])
        # charge = Stripe::Charge.create({ amount: 1399, currency: 'usd', description: 'Pearls Beard oil Subscription', source: token })
        # customer.sources.create(source: "tok_amex")
        
        # token = params[:stripeToken]
  #       plan = @model.item
  #       plan.gsub!(/\ +/, '-')
  #       email = @model.email
  #       binding.pry
  #       plan = Stripe::Plan.create({ product: 'Sandy-Cheeks', nickname: 'Sany Cheeks', interval: 'month', currency: 'usd', amount: 1399, })
    end
end



