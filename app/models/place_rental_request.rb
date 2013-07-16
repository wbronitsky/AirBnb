class PlaceRentalRequest < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :place_id, :status, :user_id

  belongs_to :place
  belongs_to :user
  has_one :place_owner, through: :place, source: :owner
  has_one :review, foreign_key: :trip_id

  validate :not_already_rented, :begin_date_not_in_past, :end_date_after_begin_date

  def self.current_trips
    self.select do |trip| 
      trip.status == "approved" && trip.end_date > Date.today
    end
  end

  def self.pending_trips
    self.select do |trip|
      trip.status == nil && trip.begin_date > Date.today
    end
  end

  def self.past_trips
    self.select do |trip|
      trip.end_date < Date.today
    end
  end

  def approve
    unless already_rented?
      self.status = "approved"
      self.save!
      approved_date_range = (begin_date..end_date)

      Place.find(self.place_id).requests.each do |request|
        next if request.id == self.id
        requested_date_range = (request.begin_date..request.end_date)
        request.deny if approved_date_range & requested_date_range
      end
    end
  end

  def deny
    self.status = "denied"
    self.save!
  end

  def already_rented?
    place_rentals = PlaceRentalRequest.where(place_id: place_id, status: "approved")
    place_rental_range = (self.begin_date..self.end_date)
    place_rentals.each do |rental| 
      other_place_rental_range = (rental.begin_date..rental.end_date)
      if place_rental_range.intersection(other_place_rental_range)
        return true
      end
    end
    false
  end

  def not_already_rented
    if already_rented?
      errors[:begin_date] << "that date has already been taken"
    end
  end

  def begin_date_not_in_past
    if begin_date < Date.today
      errors[:begin_date] << "cannot go on vacation in the past"
    end
  end

  def end_date_after_begin_date
    if begin_date > end_date
      errors[:end_date] << "check in before check out"
    end
  end
end

class Range
  def intersection(other)
    return nil if (self.max < other.begin or other.max < self.begin)
    [self.begin, other.begin].max..[self.max, other.max].min
  end
  alias_method :&, :intersection
end
