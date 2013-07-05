module ApplicationHelper

  def login(user)
    session[:session_token] = user.reset_session_token!

    redirect_to root_url
  end

  def logout(user)
    user.session_token = nil
    session[:session_token] = nil

    redirect_to new_session_url
  end

  def current_user
    return nil if session[:session_token].nil?

    User.find_by_session_token(session[:session_token])
  end

  def unread_messages
    current_user.recieved_messages.where(read: nil)
  end
end
