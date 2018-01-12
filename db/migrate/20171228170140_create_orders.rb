class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :order_num, :limit => 8
      t.integer :awb_num, :limit => 8
      t.string :customer_name
      t.string :address_line1
      t.string :address_line2
      t.string :area
      t.string :city
      t.string :state
      t.integer :pincode
      t.integer :phone_num, :limit => 8
      t.integer :attempts_count
      t.integer :user_id
      t.string  :order_type
      t.integer :order_amount
      t.string  :status
      t.string  :remarks
      t.datetime :schedule_date
      t.integer :scanned_by
      t.boolean :warehouse_status
      t.datetime :scanned_date
      t.boolean :bag_scan_status
      t.integer :bag_id
      t.integer :added_to_bag_by

      t.timestamps
    end
  end
end
