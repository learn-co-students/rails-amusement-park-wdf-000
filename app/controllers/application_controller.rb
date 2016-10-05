class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user_id,:current_user_name, :logged_in?

  def current_user_id
    session[:user_id]
  end

  def current_user_name
    User.find_by(id: session[:user_id]).name.capitalize if current_user_id
  end

  def logged_in?
    current_user_id != nil
  end
end
