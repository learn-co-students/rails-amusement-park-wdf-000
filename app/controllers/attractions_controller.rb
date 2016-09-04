class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
  
end
