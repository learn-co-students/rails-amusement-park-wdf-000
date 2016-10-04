class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # use guard clause here?
    user = User.find_by(id: params[:user][:id])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  # destroy session
  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
