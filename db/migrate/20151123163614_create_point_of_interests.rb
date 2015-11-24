class CreatePointOfInterests < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.string :name
      t.text :description
      t.date :date_added
      t.references :owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
