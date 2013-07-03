class Place < ActiveRecord::Base
  attr_accessible :filepicker_url, :bedrooms, :description, :max_occupancy, :property_type, :room_type, :title, :address_attributes

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_one :address
  has_many :requests, class_name: "PlaceRentalRequest"
  accepts_nested_attributes_for :address
 end