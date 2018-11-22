class AddTokenToForgotPassword < ActiveRecord::Migration[5.1]
  def change
    add_column :forgot_passwords, :token, :string
  end
end
