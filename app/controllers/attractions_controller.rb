class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit]

  def index
    @attractions = Attraction.all
  end

  def new
  end

  def create
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
end
