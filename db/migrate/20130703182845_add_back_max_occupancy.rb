class AddBackMaxOccupancy < ActiveRecord::Migration
  def up
    add_column :places, :max_occupancy, :integer
  end

  def down
  end
end
