class AttractionsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def new

  end

  def create
    @attraction = Attraction.create(name: params[:attraction][:name], tickets:params[:attraction][:tickets],nausea_rating:params[:attraction][:nausea_rating],happiness_rating:params[:attraction][:happiness_rating],min_height:params[:attraction][:min_height])
    redirect_to attraction_path(@attraction)
  end

  def index
    @user = User.find_by_id(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    if !@user.admin?
    if @user.tickets > @attraction.tickets
    @user.tickets = @user.tickets -  @attraction.tickets
    @user.happiness =   @user.happiness + @attraction.happiness_rating
    @user.save
    end
  end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
      @attraction = Attraction.find_by_id(params[:id])
      @attraction.update(name: params[:attraction][:name], tickets:params[:attraction][:tickets],nausea_rating:params[:attraction][:nausea_rating],happiness_rating:params[:attraction][:happiness_rating],min_height:params[:attraction][:min_height])
      redirect_to attraction_path(@attraction)
  end

end
