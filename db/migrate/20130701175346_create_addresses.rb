class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :place_id
      t.string :phone_number

      t.timestamps
    end
  end
end
