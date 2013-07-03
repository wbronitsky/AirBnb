class ChangeAddressColumnPlaceId < ActiveRecord::Migration
  def up
    remove_column :addresses, :place_id
  end

  def down
  end
end
