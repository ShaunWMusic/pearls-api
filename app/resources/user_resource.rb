class UserResource < JSONAPI::Resource
  attributes :email, :username, :password, :password_confirmation, :admin, :barbershop, :customer, :plan_id

# this feature hides certain attributes from json api
  def fetchable_fields
    super - [:password, :password_confirmation]
  end

  before_save do
    newuser = @model 
    id = @model.plan_id
    product = Plan.where('id = ?', id).pluck(:product)
    @model.scent = product[0]
    # binding.pry
    mail = NewUserMailer.New_user(newuser) if @model.new_record?
    mail.deliver_now if @model.new_record?
    @model.save
  end

end
