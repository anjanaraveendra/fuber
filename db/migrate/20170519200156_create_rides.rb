class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|
      t.float :source_lat
      t.float :source_long
      t.datetime :start_time
      t.datetime :end_time
      t.float :destination_lat
      t.float :destination_long
      t.integer :status, default: 0
      t.references :taxi, foreign_key: true

      t.timestamps
    end
  end
end
