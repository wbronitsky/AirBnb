class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      login(@user)
    else
      flash[:messages] ||= []
      flash[:messages] << @user.errors.full_messages

      redirect_to new_user_url
    end
  end

  def show
    @places = current_user.places
    @trips = PlaceRentalRequest.includes(:place)
                                .where(user_id: current_user.id, 
                                       status: "approved")
                                .order("begin_date")
  end

end
