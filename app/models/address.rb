class Address < ActiveRecord::Base
  attr_accessible :city, :country, :line1, :line2, :phone_number, :place_id, :state, :zip

  belongs_to :place 
end
