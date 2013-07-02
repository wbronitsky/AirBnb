class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :property_type
      t.string :max_occupancy
      t.string :room_type
      t.string :bedrooms
      t.string :title
      t.text :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
