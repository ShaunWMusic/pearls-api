class AddUsernameToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :username, :string
  end
end
