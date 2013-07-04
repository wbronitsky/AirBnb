class RemovePlaceId < ActiveRecord::Migration
  def up
    remove_column :places, :place_id
  end

  def down
  end
end
