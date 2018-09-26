class AddEmailToPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :email, :string
  end
end
