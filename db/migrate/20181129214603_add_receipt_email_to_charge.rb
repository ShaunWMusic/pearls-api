class AddReceiptEmailToCharge < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :receipt_email, :string
  end
end
