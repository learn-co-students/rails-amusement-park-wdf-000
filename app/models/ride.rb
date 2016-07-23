class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if 
    "Sorry. You are not tall enough to ride the #{attraction.name}."
  end
end
