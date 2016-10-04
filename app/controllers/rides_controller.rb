class RidesController < ApplicationController
  def create
    user = User.find(session[:user_id])
    attraction = Attraction.find(params[:id])
    ride = Ride.create(user: user, attraction: attraction)
    ride.take_ride
    redirect_to user_path(user), alert: ride.flash_notice
  end
end
