class AddLatToPointOfInterest < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :lat, :float
  end
end
