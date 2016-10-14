class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    # binding.pry
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_new_path
    end
  end

  def index
    @attractions = Attraction.all
    @user = User.find_by(id: session[:user_id])
    # binding.pry
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find_by(id: params[:id])
    # binding.pry
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    # binding.pry
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
