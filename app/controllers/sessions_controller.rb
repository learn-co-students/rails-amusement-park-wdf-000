class SessionsController < ApplicationController


  def new
    @user = User.new
  end


  def index

  end

  def create

    @user = User.find_by(find_user)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


  private

  def find_user
    params.require(:user).permit(:id)
  end





end
