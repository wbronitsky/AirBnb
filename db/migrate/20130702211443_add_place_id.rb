class AddPlaceId < ActiveRecord::Migration
  def up
    add_column :addresses, :place_id, :integer
  end

  def down
  end
end
