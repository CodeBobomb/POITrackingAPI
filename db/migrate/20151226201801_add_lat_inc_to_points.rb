class AddLatIncToPoints < ActiveRecord::Migration
  def change
    add_column :points, :lat_inc, :decimal
  end
end
