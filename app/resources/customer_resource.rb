class CustomerResource < JSONAPI::Resource
  attributes :account_balance, :business_vat_id, :coupon, :default_source, :description, :email, :invoice_prefix, :metadata, :shipping, :source
end
