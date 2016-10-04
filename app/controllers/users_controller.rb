class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def new
    @user = User.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end
