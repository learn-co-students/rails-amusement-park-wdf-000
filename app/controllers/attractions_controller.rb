class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit]

  def index
    @attractions = Attraction.all
  end

  def new
    redirect_to attractions_path unless admin?
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    redirect_to :back unless @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
