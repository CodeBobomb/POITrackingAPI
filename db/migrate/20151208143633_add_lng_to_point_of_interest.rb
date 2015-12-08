class AddLngToPointOfInterest < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :lng, :real
  end
end
