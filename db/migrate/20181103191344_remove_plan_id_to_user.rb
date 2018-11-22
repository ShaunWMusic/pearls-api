class RemovePlanIdToUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :plan, foreign_key: true
  end
end
