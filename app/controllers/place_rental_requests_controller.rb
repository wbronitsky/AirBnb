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
    @approved_requests = PlaceRentalRequest.includes(:user).where(place_id: params[:place_id], status: "approved")
    @denied_requests = PlaceRentalRequest.includes(:user).where(place_id: params[:place_id], status: "denied")
    @pending_requests = PlaceRentalRequest.includes(:user).where(place_id: params[:place_id], status: nil)
  end

  def destroy
    @request = PlaceRentalRequest.find(params[:id])

    if current_user.id == @request.user_id
      @request.destroy

      render json: @request
    else
      render json: @request, status: 422
    end
  end

  def show
    @request = PlaceRentalRequest.includes(:user).find(params[:id])
    @place = Place.includes(:owner).find(params[:place_id])
  end
end
