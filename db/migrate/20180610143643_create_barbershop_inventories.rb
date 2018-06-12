class CreateBarbershopInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :barbershop_inventories do |t|
      t.string :delivery_date
      t.string :barbershop_name
      t.integer :beardbark
      t.integer :sandycheeks
      t.text :comments
      t.string :contact_person
      t.integer :total_beard_oils_delivered

      t.timestamps
    end
  end
end
