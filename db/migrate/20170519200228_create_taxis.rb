class CreateTaxis < ActiveRecord::Migration[5.0]
  def change
    create_table :taxis do |t|
      t.float :latitude
      t.float :longitude
      t.string :color
      t.boolean :assigned, default: false

      t.timestamps
    end
  end
end
