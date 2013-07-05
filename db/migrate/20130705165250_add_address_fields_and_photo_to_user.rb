class AddAddressFieldsAndPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :filepicker_url, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :description, :text
  end
end
