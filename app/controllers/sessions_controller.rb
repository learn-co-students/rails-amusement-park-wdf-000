class SessionsController < ApplicationController
  def new
  end

  def create
    return redirect_to :back, alert: 'Make a selection' if user_params[:id].blank?
    session[:user_id] = user_params[:id]
    redirect_to user_path(session[:id])
  end

  def destroy
    session.delete :user_id
    redirect_to root_path, alert: 'You have logged out'
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end
end
