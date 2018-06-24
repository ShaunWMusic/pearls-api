class ChargeResource < JSONAPI::Resource
  attributes :amount, :description, :currency
end
