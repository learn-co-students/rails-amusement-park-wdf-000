class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @current_user = User.find(session[:user_id])
  end
  def show
    @attraction = Attraction.find(params[:id])
    @current_user = User.find(session[:user_id])
  end
  def new
    @attraction = Attraction.new
  end
  def create
    @attraction = Attraction.create(attrac_params)
    if @attraction.errors.empty?
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = "Looks like something went wrong, try again."
      redirect_to new_attraction_path(@attraction)
    end
  end
  def edit
    @attraction = Attraction.find(params[:id])
  end
  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attrac_params)
  end

  private
  def attrac_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :min_height, :happiness_rating)
  end
end
