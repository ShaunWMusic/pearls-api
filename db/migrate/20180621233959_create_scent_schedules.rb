class CreateScentSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :scent_schedules do |t|
      t.string :jan
      t.string :feb
      t.string :mar
      t.string :apr
      t.string :may
      t.string :jun
      t.string :jul
      t.string :aug
      t.string :sept
      t.string :oct
      t.string :nov
      t.string :dec
      t.string :userid

      t.timestamps
    end
  end
end
