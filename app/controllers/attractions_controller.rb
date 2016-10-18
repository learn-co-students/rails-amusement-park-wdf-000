class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end




  def index
    @attractions = Attraction.all

  end


  def show

    @attraction = Attraction.find_by(id: params[:id])

  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    end
  end


  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end


  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(name: params[:attraction][:name])
  end



  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end



end
