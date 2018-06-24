class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.float :amount
      t.string :description
      t.string :currency

      t.timestamps
    end
  end
end
