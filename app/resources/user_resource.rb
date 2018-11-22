class UserResource < JSONAPI::Resource
  attributes :email, :username, :password, :password_confirmation, :admin, :barbershop, :customer

# this feature hides certain attributes from json api
  def fetchable_fields
    super - [:password, :password_confirmation]
  end

  before_save do
    newuser = @model 
    product = Plan.where('id = ?', id).pluck(:product)
    @model.scent = product[0]
    # binding.pry
    @model.save
  end

end
