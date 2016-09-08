class LoginController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(user_params)
    session[:user_id] = @user.id
    return redirect_to user_path(@user)
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:id)
  end
end
