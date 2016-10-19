class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

 def create
   @user = User.new
   @user.name = params[:user][:name]
   @user.height = params[:user][:height]
   @user.happiness = params[:user][:happiness]
   @user.nausea = params[:user][:nausea]
   @user.tickets = params[:user][:tickets]
   @user.password = params[:user][:password]
   if params[:user][:admin] == "0"
     @user.admin = false
   else
     @user.admin = true
   end
   @user.save
   redirect_to user_path(@user)
 end

 def show
   @attraction = Attraction.find_by_id(params[:attraction])
   @user = User.find_by_id(params[:id])
   session[:user_id] = @user.id
 end

 def signin
   @users = User.all

 end

 def getid
   @user = User.find_by_id(params[:user][:id])
   redirect_to user_path(@user)
 end

 def signout
   session.clear
   redirect_to  '/'
 end


end
