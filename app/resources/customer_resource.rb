require 'bcrypt'

class CustomerResource < JSONAPI::Resource
  attributes :account_balance, :business_vat_id, :coupon, :default_source, :description, :email, :invoice_prefix, :metadata, :source, :token, :card, :username, :user_id, :created_at
  filters :unsubscribe 
  
  before_save do
        # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        token = @model.token
        create_customer =  Stripe::Customer.create( :description => "Customer for Pearls Beard Oil", :source => token, :email => email, :coupon => coupon )
        @model.source = create_customer.id
        email = @model.token
        email = @model.email
        plan = Plan.new
        plan.email = email
        plan.save
        newuser = @model

        # Creates new user account with email & username
        create_user = User.new
        create_user.email = email
        create_user.username = create_user.email.split('@')[0]
        create_user.save!
        new_user_created = User.find_by!(email: email)
        @model.user_id = new_user_created.id
        randomnumbers = 4.times.map{ 20 + Random.rand(11) }.join(",").gsub(/[\s,]/ ,"")
        create_user.password_digest = BCrypt::Password.create(randomnumbers)
        create_user.save 

        # binding.pry
        create_account = NewAccount.new
        create_account.email = email
        create_account.password_digest = randomnumbers
        create_account.user_id = create_user.id 
        data = {id: new_user_created.id, email: new_user_created.email}
        # this token is set expire in 1 hour
        payload = {data: data, sub: new_user_created.id, exp: Time.now.to_i * 3600}
        token = JWT.encode payload, JWT_SECRET, "HS512"
        create_account.token = token if @model.new_record? 
        create_account.save
        new_account = @model 


        mail = NewUserMailer.New_user(newuser) if @model.new_record?
        mail_new_account = NewAccountMailer.New_account(create_account) if @model.new_record?
        mail.deliver_now if @model.new_record?
        mail_new_account.deliver_now if @model.new_record?
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
      when :unsubscribe
        findRecord = records.where('source = ?', value).pluck(:source, :email) 
        customerRetrieval = Stripe::Customer.retrieve(findRecord[0].first)
        subscriptionId = customerRetrieval.subscriptions.data[0].id
        subscriptiondata = Stripe::Subscription.retrieve(subscriptionId)
        subscriptiondata.delete
        mail = UnsubscribeMailer.Cancel_account(findRecord[0].last) 
        mail.deliver_now
        records.where('source = ?', value)
        
        # records.where('user_id LIKE ?', "%#{value.first}%")
      else
        super
      end
    end
end



