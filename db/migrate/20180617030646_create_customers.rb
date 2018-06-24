class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.integer :account_balance
      t.integer :business_vat_id
      t.string :coupon
      t.string :default_source
      t.string :description
      t.string :email
      t.string :invoice_prefix
      t.string :metadata
      t.string :shipping
      t.string :source

      t.timestamps
    end
  end
end
