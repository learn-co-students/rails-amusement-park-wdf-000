class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find_by(id: params[:id])
    @attraction = Attraction.find_by(id: params[:attraction_id])
    @user.rides.find_or_create_by(user: @user, attraction: @attraction)
    flash[:alert] = @user.rides.last.take_ride
    @user.save
    redirect_to user_path @user
  end

  def destroy
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end

end
