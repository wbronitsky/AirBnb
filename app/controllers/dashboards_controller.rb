class DashboardsController < ApplicationController
  def show
    @user = current_user
    @places = current_user.places
  
    @trips = PlaceRentalRequest.includes(:place)
                                .where(user_id: current_user.id)
                                .order("begin_date")
    @current_trips = @trips.select {|trip| trip.status == "approved" && trip.begin_date > Date.today}
    @pending_trips = @trips.select {|trip| trip.status == nil && trip.begin_date > Date.today}
    @past_trips = @trips.select {|trip| trip.end_date < Date.today}
  end
end
