class RemoveEmailFromPlan < ActiveRecord::Migration[5.1]
  def change
    remove_column :plans, :email, :string
  end
end
