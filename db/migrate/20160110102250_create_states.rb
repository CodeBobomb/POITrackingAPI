class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.boolean :motor_running, default: false
      t.boolean :windows_up, default: false
      t.boolean :car_locked, default: false
      t.references :point_of_interest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
