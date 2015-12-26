class AddTrackingToPointOfInterests < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :tracking, :boolean
  end
end
