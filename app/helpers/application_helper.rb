module ApplicationHelper

  def signed_in?
    !!session[:user_id]
  end

  def current_user
    @user ||= User.find_by(session[:user_id])
  end

end
