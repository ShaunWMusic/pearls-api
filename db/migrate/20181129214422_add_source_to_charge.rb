class AddSourceToCharge < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :source, :string
  end
end
