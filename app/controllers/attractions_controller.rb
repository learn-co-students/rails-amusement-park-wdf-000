class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    Attraction.find(params[:id]).update(attr_params)
    redirect_to attraction_path(Attraction.find(params[:id]))
  end

  def delete
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attr_params)
    redirect_to attraction_path(attraction) if attraction.save
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def ride
    ride = Ride.create(attraction_id: ride_params, user_id: session[:user_id])
    if ride.take_ride.nil?
      flash[:alert] = "Thanks for riding the #{ride.attraction.name}!"
    else flash[:alert] = ride.take_ride
    end
    redirect_to user_path(ride.user)
  end

  def ride_params
    params.require(:id)
  end

  def attr_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end


end
