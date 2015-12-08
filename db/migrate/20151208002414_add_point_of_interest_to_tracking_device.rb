class AddPointOfInterestToTrackingDevice < ActiveRecord::Migration
  def change
    add_column :tracking_devices, :point_of_interest_id, :integer
  end
end
