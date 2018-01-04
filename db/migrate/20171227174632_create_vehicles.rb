class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :driver_name
      t.integer :driver_phone_num
      t.string :vehicle_num
      t.string :license_num
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :pincode
      t.string :identity_proof
      t.string :identity_num
      t.string :string
      t.integer :user_id

      t.timestamps
    end
  end
end
