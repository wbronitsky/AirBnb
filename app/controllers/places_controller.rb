class PlacesController < ApplicationController

  def index
    @search = Place.search do
      with(:max_occupancy).greater_than(params[:search][:guest_num].to_i - 1)

      fulltext params[:search][:text] do
        boost_fields :city => 2.0
      end
    end

    @search = @search.results

    if params[:request]
      unless params[:request][:begin_date] == "" && params[:request][:end_date] == ""
        @search = @search.select do |place|
         request = place.requests
                        .build(begin_date: params[:request][:begin_date],
                               end_date: params[:request][:end_date])
          !request.already_rented?
        end
      end
    end
  end

  def new
    @place = Place.new(params[:place])
  end

  def create
    @place = current_user.places.build(params[:place])

    if @place.save
      redirect_to current_user
    else 
      flash[:messages] ||= []
      flash[:messages] << @place.errors.full_messages
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    redirect_to current_user
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(params[:place])

    redirect_to current_user
  end
end
