require 'bcrypt'

class CustomerResource < JSONAPI::Resource
  attributes :account_balance, :business_vat_id, :coupon, :default_source, :description, :email, :invoice_prefix, :metadata, :source, :token, :card, :username, :user_id, :created_at, :tracking_number, :updated_at
  filters :receipt, :unsubscribe, :subscribe
  
  before_save do
        # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        token = @model.token
        create_customer =  Stripe::Customer.create( :description => description, :source => token, :email => email, :coupon => coupon )  if @model.new_record?
        @model.source = create_customer.id if @model.new_record?
        email = @model.token
        email = @model.email
        plan = Plan.new if @model.new_record?
        plan.email = email if @model.new_record?
        plan.save  if @model.new_record?
        newuser = @model

        # Creates new user account with email & username
        create_user = User.new  if @model.new_record?
        create_user.email = email if @model.new_record?
        create_user.username = create_user.email.split('@')[0] if @model.new_record?
        create_user.save! if @model.new_record?
        new_user_created = User.find_by!(email: email)
        @model.user_id = new_user_created.id if @model.new_record?
        randomnumbers = 4.times.map{ 20 + Random.rand(11) }.join(",").gsub(/[\s,]/ ,"")
        create_user.password_digest = BCrypt::Password.create(randomnumbers) if @model.new_record?
        create_user.save if @model.new_record?

        create_account = NewAccount.new  if @model.new_record?
        create_account.email = email if @model.new_record?
        create_account.password_digest = randomnumbers if @model.new_record?
        create_account.user_id = create_user.id if @model.new_record?
        data = {id: new_user_created.id, email: new_user_created.email}
        # this token is set expire in 1 hour
        payload = {data: data, sub: new_user_created.id, exp: Time.now.to_i * 3600}
        token = JWT.encode payload, JWT_SECRET, "HS512"
        create_account.token = token if @model.new_record? 
        create_account.save if @model.new_record?
        new_account = @model 


        # mail = NewUserMailer.New_user(newuser) if @model.new_record?
        # mail.deliver_now if @model.new_record?
        mail_new_account = NewAccountMailer.New_account(create_account) if @model.new_record?
        mail_new_account.deliver_now if @model.new_record?
      #  email tracking number to customer
       sendtrackingnumber = @model if @model.tracking_number?
       mail = TrackingNumberMailer.Tracking_numbercustomer(sendtrackingnumber) if @model.tracking_number?
       mail.deliver_now if @model.tracking_number?

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
    def self.apply_filter(records, filter, value, options)
      case filter
      when :receipt
        records.where('user_id = ?', value)
      when :unsubscribe
        findRecord = records.where('user_id = ?', value).pluck(:source, :email, :id) 
        customerRetrieval = Stripe::Customer.retrieve(findRecord[0].first)
        subscriptionId = customerRetrieval.subscriptions.data[0].id
        subscriptiondata = Stripe::Subscription.retrieve(subscriptionId)
        subscriptiondata.delete
        planrecord = Plan.find_by!(customer_id: findRecord[0].last)
        subrecord = Subscription.find_by!(customer_id: planrecord.id)
        planrecord.delete
        subrecord.delete
        records.delete(findRecord[0].last)
        mail = UnsubscribeMailer.Cancel_account(findRecord[0].second) 
        mail.deliver_now
        records.where('user_id = ?', value)
      # when :subscribe
      #   binding.pry
      #    plan_id = @model.customer_id
      #   findplan = Plan.where(id: plan_id).pluck(:product, :id, :customer_id)
      #   product = findplan[0].first
      #   plan_id = findplan[0].second
      #   customer_id = findplan[0].third
      #   @model.item = product
      #   source = Customer.where(id: customer_id).pluck(:source)
        
      #   plan = Stripe::Plan.retrieve(product)
      #   Stripe::Subscription.create( :customer => source[0], :items => [{ :plan => plan.id}], :coupon => "black-friday")
        # records.where('user_id LIKE ?', "%#{value.first}%")
      else
        super
      end
    end
end



