class AddLngToPointOfInterest < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :lng, :float
  end
end
