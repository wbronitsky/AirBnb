class PlacesController < ApplicationController

  def new
    @place = Place.new(params[:place])
    @place.build_address
  end

  def create
    @place = current_user.places.build(params[:place])

    if @place.save
      redirect_to @place
    else 
      flash[:messages] ||= []
      flash[:messages] << @place.errors.full_messages
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def index
    @places = current_user.places
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    redirect_to places_url
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(params[:place])

    redirect_to places_url
  end
end
