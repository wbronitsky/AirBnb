class AddAddressesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :line1, :string
    add_column :places, :line2, :string
    add_column :places, :city, :string
    add_column :places, :state, :string
    add_column :places, :zip, :string
    add_column :places, :country, :string
    add_column :places, :phone_number, :string
  end
end
