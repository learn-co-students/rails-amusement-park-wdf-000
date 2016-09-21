class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
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

  def destroy
    attraction = Attraction.find(params[:id])
    attraction.destroy
    if attraction.errors.empty?
      flash[:message] = "Poof!"
    else
      flash[:message] = "This attraction is too attractive to be deleted. Deal with it."
    end
    redirect_to attractions_path
  end


  private
    def attrac_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :min_height, :happiness_rating)
    end
end
