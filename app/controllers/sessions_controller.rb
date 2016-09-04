class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
