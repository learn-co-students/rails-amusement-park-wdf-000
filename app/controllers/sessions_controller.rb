class SessionsController < ApplicationController
  before_action :current_user

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    login_user(user)
    redirect_to user_path(user)
  end

  def signin
    @user = User.new
  end
  
  def login
    user = User.find_by(id: params[:user][:id])
    login_user(user)
    redirect_to user_path(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


  private
    def user_params
      params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
    end

    def login_user(user)
      session[:user_id] = user.id
    end
end
