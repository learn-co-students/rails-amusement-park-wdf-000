class UsersController < ApplicationController
  def index
    # binding.pry
    @user = User.find_by(id:session[:user_id])
  end

  def show
    # binding.pry
    @user = User.find_by(id:session[:user_id])
  end

  def now
    # binding.pry
    @user = User.find_by(id:params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def login
    @user = User.new
    render '/users/login'
  end


  def new
    @user = User.new
  end

  def create
    # binding.pry
    use = User.new(user_params)
    if use.save
      session[:user_id] = use.id
      redirect_to "/users/#{use.id}"
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    # @user.destroy
    session.clear
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:height,:happiness,:nausea,:tickets,:password,:admin)
  end

end
