class AddLatToPointOfInterest < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :lat, :real
  end
end
