class AddTrackingNumberToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :tracking_number, :string
  end
end
