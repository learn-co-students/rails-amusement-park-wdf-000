class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #
  # include Pundit

  # before_filter :authenticate_user!

 def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
 end

end
