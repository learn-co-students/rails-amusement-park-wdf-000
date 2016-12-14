class RidesController < ApplicationController

  def create
    @ride = Ride.create(attraction_id: params[:attraction_id], user_id: params[:user_id])
    flash[:alert] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end
end
