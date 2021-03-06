class PlanResource < JSONAPI::Resource
    attributes :currency, :interval, :product, :amount, :customer_id, :email
      
    before_save do 
        id = @model.customer_id
        findplan = Customer.find_by!(id: id)
        @model.product = findplan.description 
        # user = User.new
        plan = @model.product
        # plan.gsub!(/\ +/, '-')
        plan = Stripe::Plan.retrieve(plan)
        @model.interval = plan.interval
        @model.amount = plan.amount
        @model.currency = plan.currency
        # user.save
        @model.save     
    end
end

# This is how to Create Plans
# Stripe::Plan.create( :amount => 1399, :interval => "month", :product => { :name => "Sandy Cheeks" }, :currency => "usd", :id => "Sandy-Cheeks")
# Stripe::Plan.create( :amount => 1399, :interval => "month", :product => { :name => "Sandy Cheeks" }, :currency => "usd", :id => "Beard-Bark")
