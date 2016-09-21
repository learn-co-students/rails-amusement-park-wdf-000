class RidesController < ApplicationController
  def new
  end
  def create
    @ride = Ride.create(ride_params)
    flash[:message] = @ride.take_ride
    redirect_to user_path(User.find(session[:user_id]))
  end

  private
    def ride_params
      params.permit(:user_id, :attraction_id)
    end
end
