class AddUserIdToScentSchedule < ActiveRecord::Migration[5.1]
  def change
    add_reference :scent_schedules, :user, foreign_key: true
  end
end
