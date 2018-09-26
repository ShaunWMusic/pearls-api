class AddCardToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :card, :string
  end
end
