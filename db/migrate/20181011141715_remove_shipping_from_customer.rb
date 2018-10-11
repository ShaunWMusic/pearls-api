class RemoveShippingFromCustomer < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :shipping, :string
  end
end
