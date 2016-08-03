class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(users_params)
    session[:user_id] = user.id if user.save
    redirect_to user_path(user)
  end

  def show
    @attractions = @user.attractions
    @message = params[:message] || false
  end

  def signin
    @user = User.new
    @users = User.all
  end

  def login
    user = User.find(params[:user][:id])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end
end
