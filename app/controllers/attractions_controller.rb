class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
  end
  
  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def ride
    ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)
    ride_message = ride.take_ride
    redirect_to "/users/#{current_user.id}?ride_message=#{ride_message}"
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      redirect_to new_attraction_path
    end 
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
