class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.boolean :is_admin
      t.boolean :is_barbershop
      t.boolean :is_customer

      t.timestamps
    end
  end
end
