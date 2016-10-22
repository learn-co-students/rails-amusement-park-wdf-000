class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def show
  end

  def create
    # raise user_params.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end

  def destroy
  end

  private

   def user_params
     params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
   end

end
