class AttractionsController < ApplicationController
   def index
     @attractions = Attraction.all
     @user = User.find_by(id: session[:user_id])
   end

   def show
     @user = User.find_by(id: session[:user_id])
     @attraction = Attraction.find_by(id: params[:id])
   end

   def new
     @attraction = Attraction.new
   end

   def edit
     @attraction = Attraction.find_by(id: params[:id])
   end

   def create
     @attraction = Attraction.new(attraction_params)
     if @attraction.save
       return redirect_to attraction_path(@attraction)
     else
       render :new
     end
   end

   def update
     @attraction = Attraction.find_by(id: params[:id])
     @attraction.update_attributes(attraction_params)
     redirect_to attraction_path(@attraction)
   end

   def attraction_params
     params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
   end
 end
