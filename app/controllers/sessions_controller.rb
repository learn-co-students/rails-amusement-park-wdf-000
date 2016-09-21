class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:id])
    if @user.errors.empty?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages[0]
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  # private
  # def session_params
  #   params.require(:user).permit(:id)
  # end

end
