class CreateScentSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :scent_schedules do |t|
      t.string :scent

      t.timestamps
    end
  end
end
