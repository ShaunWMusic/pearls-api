class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :customer
      t.string :billing
      t.string :billing_cycle_anchor
      t.string :coupon

      t.timestamps
    end
  end
end
