class PlaceRentalRequestsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
  end

  def create
    place_rental_request = current_user.requests.build(params[:request])
    if place_rental_request.save
      redirect_to place_url(params[:place_id])
    else
      flash[:messages] ||= []
      flash[:messages] << "Not going to work"

      redirect_to place_url(params[:place_id])
    end
  end

  def approve
    request = PlaceRentalRequest.find(params[:id])
    request.approve

    redirect_to place_url(params[:place_id])
  end

  def deny
    request = PlaceRentalRequest.find(params[:id])
    request.deny

    redirect_to place_url(params[:place_id])
  end

  def index
    @place = Place.find(params[:place_id])
    @requests = PlaceRentalRequest.includes(:user).where(place_id: params[:place_id])
  end
end
