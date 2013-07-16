class DashboardsController < ApplicationController
  def show
    @user = current_user
    @places = current_user.places
  
    @trips = PlaceRentalRequest.includes(:place)
                                .where(user_id: current_user.id)
                                .order("begin_date")
    @current_trips = @trips.current_trips
    @pending_trips = @trips.pending_trips
    @past_trips = @trips.past_trips
  end
end
