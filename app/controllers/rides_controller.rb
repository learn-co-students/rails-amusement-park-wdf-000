class RidesController < ApplicationController

   def create
       @user = User.find_by(id: session[:user_id])
       @attraction = Attraction.find_by(id: params[:id])
       @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
       flash[:notice] = @ride.take_ride
       redirect_to user_path(@user)
   end

 end
