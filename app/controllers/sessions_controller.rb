class SessionsController < ApplicationController

def new
  @users = User.all
  @user = User.new
end

def create
  @user = User.find(params[:user][:id])
  if @user
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    redirect_to root_path
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_path
end

end
