class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    unless user
      flash[:messages] ||= []
      flash[:messages] << "No user found with that email. Please sign up"

      redirect_to new_user_url
      return
    end


    if user.verify_password(params[:user][:password])
      login(user)
    else
      flash[:messages] ||= []
      flash[:messages] << "Wrong email/password combo"

      redirect_to new_session_url
    end
  end

  def destroy
    logout(current_user)
  end
end
