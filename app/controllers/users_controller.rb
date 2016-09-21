class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages[0]
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :tickets, :nausea, :admin)
  end
end
