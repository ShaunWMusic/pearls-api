require "stripe"
class PlanResource < JSONAPI::Resource
    attributes :currency, :interval, :product, :amount, :customer_id, :email
      
    before_save do 
        stripe = Stripe.api_key = ENV['SECRET_KEY']
        id = @model.customer_id
        # binding.pry
        # findplan = Plan.find_by!(customer_id: id) 
        # @model.product = findplan.product 
        user = User.new
        plan = @model.product
        plan.gsub!(/\ +/, '-')
        plan = Stripe::Plan.retrieve(plan)
        @model.interval = plan.interval
        @model.amount = plan.amount
        @model.currency = plan.currency
        user.save
        @model.save     
    end
end

# This is how to Create Plans
# Stripe::Plan.create( :amount => 1399, :interval => "month", :product => { :name => "Sandy Cheeks" }, :currency => "usd", :id => "Sandy-Cheeks")
# Stripe::Plan.create( :amount => 1399, :interval => "month", :product => { :name => "Sandy Cheeks" }, :currency => "usd", :id => "Beard-Bark")
