class AddTypeToPoints < ActiveRecord::Migration
  def change
    add_column :points, :inc, :boolean
  end
end
