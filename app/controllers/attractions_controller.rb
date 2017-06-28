class AttractionsController < ApplicationController
  before_action :current_user
  def index
    @attractions = Attraction.all 
  end

  def show
    @attraction = Attraction.find_by(:id => params[:id])
  end
  
  def ride
    @attraction = Attraction.find_by(:id => params[:id])
    ride = Ride.create(:user_id => @user.id, :attraction_id => @attraction.id)
    flash[:notice] = ride.take_ride
    redirect_to user_path(@user) 
  end
  
  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find_by(:id => params[:id])
  end
  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
