class Review < ActiveRecord::Base
  attr_accessible :body, :trip_id, :user_id, :place_id

  belongs_to :trip, class_name: "PlaceRentalRequest", foreign_key: :trip_id
  belongs_to :user 
  belongs_to :place_rented, class_name: "Place", foreign_key: :place_id
  has_one :place_rented_owner, through: :place_rented, source: :owner
end
