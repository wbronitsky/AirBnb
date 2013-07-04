class Place < ActiveRecord::Base
  attr_accessible :filepicker_url, :bedrooms, :description, 
                  :max_occupancy, :property_type, :room_type, 
                  :title, :address_attributes, :line1, :line2, 
                  :city, :state, :zip, :phone_number,
                  :day_price, :week_price, :month_price,
                  :check_in, :check_out, :special_info

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_one :address
  has_many :requests, class_name: "PlaceRentalRequest"
  accepts_nested_attributes_for :address
    
  searchable do 
    text :city, :state, :title, :description

    integer :max_occupancy

    string :sort_title do
      title.downcase.gsub(/^(an?|the)/, '')
    end
  end
 end