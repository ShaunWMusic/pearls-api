class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :currency
      t.string :interval
      t.string :product
      t.string :amount

      t.timestamps
    end
  end
end
