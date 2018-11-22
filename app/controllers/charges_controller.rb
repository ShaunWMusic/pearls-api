class ChargesController < ApplicationController
  def new
end

def create
  # Amount in cents
  @amount = 750

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Pearls Beard Oil',
    :currency    => 'usd'
  )

  subscription = Stripe::Subscription.create({
    :customer => customer.id,
    items: [{plan: 'plan_CBXbz9i7AIOTzr'}],
})

resource_serializer = JSONAPI::ResourceSerializer.new(ChargeResource)
json = resource_serializer.serialize_to_hash(ChargeResource.new(@customer, @charge, @subscription, nil))

render json: json


rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
