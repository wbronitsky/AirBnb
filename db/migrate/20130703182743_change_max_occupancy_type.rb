class ChangeMaxOccupancyType < ActiveRecord::Migration
  def up
    remove_column :places, :max_occupancy
  end

  def down
  end
end
