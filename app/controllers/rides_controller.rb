class RidesController < ApplicationController


  def new

  end


  def index
  end

  def create
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:ride][:attraction_id])
      if @ride.take_ride.class != String
        @ride.save
        flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
      else
        flash[:notice] = @ride.take_ride
      end
      redirect_to user_path(current_user)
  end

  #in this method you used a hidden field to pass in the attraction is in your params for create
  #and  your make a demo ride instance with the user id and the attraction it. remember a method always return true unless the
  #the value is nil or false. strings and everthing else is true. so I check the class of the method and if its not a string it
  #means my ride is takeable for the usr because the method only returns a string if I have a message. If it doesnt not resturn a string
  #i know my ride is savable and I save the ride instance into the database and add a flash notice. else I return the flash messages
  #the ride instance and the take_ride method returns.








end
