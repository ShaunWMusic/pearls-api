class CreateNewAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :new_accounts do |t|
      t.string :email
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
