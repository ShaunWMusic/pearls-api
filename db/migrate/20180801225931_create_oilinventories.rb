class CreateOilinventories < ActiveRecord::Migration[5.1]
  def change
    create_table :oilinventories do |t|
      t.integer :sandycheeks
      t.integer :beardbark
      t.integer :totalbottles

      t.timestamps
    end
  end
end
