class AddItemToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :item, :string
  end
end
