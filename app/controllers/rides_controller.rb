class RidesController < ApplicationController
  before_action :find_ride, only: [:show]

  def create
    ride =  Ride.create(ride_params)
    flash[:notice] = ride.take_ride
    redirect_to user_path(ride.user)
  end

  private
    def find_ride
      @ride = Ride.find_by(id: params[:id])
    end

    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
end
