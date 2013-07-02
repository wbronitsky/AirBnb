class AddNameOfAttrForFilepickerUrlToUser < ActiveRecord::Migration
 def up
      add_column :places, :filepicker_url, :string
  end

  def down
      remove_column :places, :filepicker_url
  end
end
