class UsersController < ApplicationController

  # before_action :set_user
  before_action :set_user, only: [:show, :update, :destroy]
  # before_action :require_login

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end


    def show
      # authorize @user
    end

    def edit
    end

    def create
     @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       # binding.pry
       redirect_to user_path(@user)
     end
   end


    # def update
    #   @user.update(user_params)
    #   authorize @user
    # end
    #
    # def destroy
    #   authorize @user
    #   @user.destroy
    # end

    private

    def user_params
     params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end
    #
    # def require_login
    #   redirect_to '/' unless current_user
    # end

    def set_user
      @user = User.find_by(id: params[:id])
    end


  end
