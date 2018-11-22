class AddUserIdToNewAccount < ActiveRecord::Migration[5.1]
  def change
    add_reference :new_accounts, :user, foreign_key: true
  end
end
