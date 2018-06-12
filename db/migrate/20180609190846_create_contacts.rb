class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :barbershop
      t.string :contact_person
      t.string :phone_number
      t.string :email
      t.text :call_log
      t.string :website
      t.string :address

      t.timestamps
    end
  end
end
