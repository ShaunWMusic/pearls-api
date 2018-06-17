class UserResource < JSONAPI::Resource
  attributes :email, :username, :password, :password_confirmation, :admin, :barbershop, :customer

# this feature hides certain attributes from json api
  def fetchable_fields
    super - [:password, :password_confirmation]
  end
end
