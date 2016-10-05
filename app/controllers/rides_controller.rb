class RidesController < ApplicationController
  def create
    raise "stop".inspect
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end
end
