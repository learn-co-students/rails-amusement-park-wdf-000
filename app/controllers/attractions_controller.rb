class AttractionsController < ApplicationController
  before_action :current_user
  before_action :set_attraction, only: [:show, :edit]

  def show

  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attractions_params)
    redirect_to attraction_path(attraction)
  end

  def edit

  end

  def update

  end

  def index
    @attractions = Attraction.all
  end

  def take_ride
    ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    message = ride.take_ride
    redirect_to user_path(ride.user, :message => message)
  end

  private
  def current_user
    @user = User.find(session[:user_id])
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attractions_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
