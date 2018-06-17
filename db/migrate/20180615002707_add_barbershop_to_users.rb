class AddBarbershopToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :barbershop, :boolean
  end
end
