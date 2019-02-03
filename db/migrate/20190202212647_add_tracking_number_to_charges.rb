class AddTrackingNumberToCharges < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :tracking_number, :string
  end
end
