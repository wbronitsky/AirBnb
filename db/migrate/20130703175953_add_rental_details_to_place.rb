class AddRentalDetailsToPlace < ActiveRecord::Migration
  def change
    add_column :places, :day_price, :string
    add_column :places, :week_price, :string
    add_column :places, :month_price, :string
    add_column :places, :check_in, :string
    add_column :places, :check_out, :string
    add_column :places, :special_info, :text
  end
end
