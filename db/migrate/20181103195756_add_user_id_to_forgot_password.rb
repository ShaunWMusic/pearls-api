class AddUserIdToForgotPassword < ActiveRecord::Migration[5.1]
  def change
    add_reference :forgot_passwords, :user, foreign_key: true
  end
end
