class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find_by(id: params["user"]["id"])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
