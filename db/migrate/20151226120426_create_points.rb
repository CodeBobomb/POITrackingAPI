class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.float :lng
      t.float :lat
      t.references :point_of_interest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
