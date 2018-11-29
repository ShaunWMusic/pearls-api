class SubscriptionResource < JSONAPI::Resource
    attributes :customer_id, :billing, :billing_cycle_anchor, :coupon, :item, :email


    before_save do 
        plan_id = @model.customer_id
        findplan = Plan.where(id: plan_id).pluck(:product, :id, :customer_id)
        product = findplan[0].first
        plan_id = findplan[0].second
        customer_id = findplan[0].third
        @model.item = product
        source = Customer.where(id: customer_id).pluck(:source)
        
        plan = Stripe::Plan.retrieve(product)
        Stripe::Subscription.create( :customer => source[0], :items => [{ :plan => plan.id}])
        # Stripe::Subscription.create( :customer => source[0], :items => [{ :plan => plan.id}], :coupon => "black-friday")

        # customer_id = Customer.find_by!(email: email).pluck(:id)
        # customer =  Stripe::Customer.create( :description => "Customer for Pearls Beard Oil", :source => "tok_visa", :email => email )
        # subscription = Stripe::Subscription.create( :customer => customer.id, :items => [{ :plan => plan.id,},])
    end
end
