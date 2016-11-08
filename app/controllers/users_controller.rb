class UsersController < ApplicationController

  def new
    #sign up a new user
    @user = User.new
  end

  def create
    #post request to create the new user that signed up

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end


  def show
    @user = User.find_by(id: params[:id])
  end

  def index

  end




private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
