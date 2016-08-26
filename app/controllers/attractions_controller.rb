class AttractionsController < ApplicationController
  def index
    @user = User.find_by(id:session[:id])
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id:params[:id])
  end

  def take_ride
    @attraction = Attraction.find_by(id:params[:attraction][:id])
    @user = User.find_by(id:session[:user_id])
    ride = Ride.create(user_id:session[:user_id], attraction_id:@attraction.id)
    # ride.take_ride
    # redirect_to user_path(session[:user_id])
    tmp = ride.take_ride
    if tmp.class != String
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    else
      flash[:notice] = tmp
    end
    redirect_to user_path(session[:user_id])
  end

  def edit
    @attraction = Attraction.find_by(id:params[:id])
  end

  def update
    @attraction = Attraction.find_by(id:params[:id])
    @attraction.update(att_params)
    redirect_to attraction_path(@attraction)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(att_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to root_path
    end
  end

  private
  def att_params
    params.require(:attraction).permit(:name,:tickets,:nausea_rating,:happiness_rating,:min_height)
  end

end
