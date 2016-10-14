class SessionsController < ApplicationController
  def new
    @user = User.new
    # binding.pry
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    # binding.pry
  end

  def destroy
    # binding.pry
    session[:user_id] = nil
    redirect_to '/'
  end

end
