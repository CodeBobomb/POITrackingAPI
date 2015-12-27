class AddLngIncToPoints < ActiveRecord::Migration
  def change
    add_column :points, :lng_inc, :decimal
  end
end
