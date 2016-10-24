class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attr = Attraction.new
  end

  def create
    @attr = Attraction.create(attr_params)
    redirect_to @attr 
  end

  def show
    @attr =  Attraction.find(params[:id])
  end

  def edit
    @attr =  Attraction.find(params[:id])
  end

  def update
    if @attr
      @attr.update(attr_params)
    end
  end

  def update_user_stats
    @attr =  Attraction.find(params[:format])
    ride = @attr.rides.build(:user_id => current_user.id)
    ride.save
    x = ride.take_ride
    y = ride.flash_message(x)
    flash[:notice] = y
    redirect_to user_path(current_user)
  end

  private
  def attr_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end