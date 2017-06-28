class RidesController < ApplicationController
  def new
    ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:notice] = ride.take_ride
    user = ride.user
    redirect_to user_path(user)
  end
end
