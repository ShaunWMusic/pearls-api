class ContactResource < JSONAPI::Resource
  attributes :barbershop, :contact_person, :phone_number, :email, :call_log, :website, :address
end
