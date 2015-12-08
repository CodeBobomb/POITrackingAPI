class CreateTrackingDevices < ActiveRecord::Migration
  def change
    create_table :tracking_devices do |t|
      t.string :device_name
      t.string :device_type

      t.timestamps null: false
    end
  end
end
