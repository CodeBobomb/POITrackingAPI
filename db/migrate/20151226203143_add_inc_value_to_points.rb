class AddIncValueToPoints < ActiveRecord::Migration
  def change
    add_column :points, :inc_value, :float
  end
end
