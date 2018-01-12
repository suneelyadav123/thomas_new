class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.string :agagent_number
      t.string :payment_status
      t.string :status

      t.timestamps
    end
  end
end
