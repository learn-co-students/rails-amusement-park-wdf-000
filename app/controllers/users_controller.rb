class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end

  def signin
  end

  def login
    @user = User.find(user_params[:id])
    params[:user][:password], @user[:password] = "password", "password"
    @user.save
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end


end
