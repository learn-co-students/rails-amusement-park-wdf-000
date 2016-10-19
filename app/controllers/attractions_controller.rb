class AttractionsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.new
    @attraction.name = params[:attraction][:name]
    @attraction.tickets = params[:attraction][:tickets]
    @attraction.nausea_rating = params[:attraction][:nausea_rating]
    @attraction.happiness_rating = params[:attraction][:happiness_rating]
    @attraction.min_height = params[:attraction][:min_height]
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.name = params[:attraction][:name]
    @attraction.tickets = params[:attraction][:tickets]
    @attraction.nausea_rating = params[:attraction][:nausea_rating]
    @attraction.happiness_rating = params[:attraction][:happiness_rating]
    @attraction.min_height = params[:attraction][:min_height]
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def new
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    if !@user.admin?
      if @user.tickets > @attraction.tickets
        @user.tickets = @user.tickets - @attraction.tickets
        @user.happiness = @user.happiness + @attraction.happiness_rating
        @user.save
      end
    end
  end
end
