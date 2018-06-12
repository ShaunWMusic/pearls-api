class BarbershopInventoryResource < JSONAPI::Resource
  attributes :delivery_date, :barbershop_name, :beardbark, :sandycheeks, :comments, :contact_person, :total_beard_oils_delivered
end
