class RidesController < ApplicationController
  def show
    # binding.pry
  end

  def new
    # binding.pry
  end

  def create
    @attraction = Attraction.find_by(id: params[:attraction_id]) 
    @user = User.find_by(id: session[:user_id]) 
    @ride = Ride.new
    @ride.attraction = @attraction
    @ride.user = @user
    flash[:notice] = @ride.take_ride
    return redirect_to user_path(@user)
  end
end
