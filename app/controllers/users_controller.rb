class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @ride = Ride.last
    if @ride != nil && @user.id  == @ride.user_id
      @message = @ride.take_ride
      @user = User.find_by(id: @ride.user_id)
      flash[:notice] = @message
      # binding.pry
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
