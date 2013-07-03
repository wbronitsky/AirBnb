class CreatePlaceRentalRequests < ActiveRecord::Migration
  def change
    create_table :place_rental_requests do |t|
      t.integer :user_id
      t.integer :place_id
      t.date :begin_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
