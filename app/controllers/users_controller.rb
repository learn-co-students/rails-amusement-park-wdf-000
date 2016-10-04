class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to :back unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(session[:user_id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
