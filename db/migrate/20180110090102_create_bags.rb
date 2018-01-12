class CreateBags < ActiveRecord::Migration[5.1]
  def change
    create_table :bags do |t|
      t.string :number
      t.integer :user_id
      t.integer :schedule_id
      t.integer :agent_number
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
