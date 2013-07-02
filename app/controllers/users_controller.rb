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
end
