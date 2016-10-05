class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    result = ride.take_ride
    if result.class == String
      redirect_to user_path(current_user_id), alert: result
    else
      redirect_to user_path(current_user_id), notice: "Thanks for riding the #{Attraction.find(ride_params[:attraction_id]).name}!"
    end
  end

  private

  # is this safe?
  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
