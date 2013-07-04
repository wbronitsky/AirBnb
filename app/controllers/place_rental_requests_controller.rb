class PlaceRentalRequestsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
  end

  def create
    place_rental_request = current_user.requests.build(params[:request])
    if place_rental_request.save
      render json: place_rental_request
    else
      render json: place_rental_request, status: 422
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
