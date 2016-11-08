class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    msg = "Sorry."
    if !hasEnoughTickets?
      msg += " You do not have enough tickets the #{attraction.name}."
    end
    if !isTallEnough?
      msg += " You are not tall enough to ride the #{attraction.name}."
    end

    if msg != "Sorry."
      msg
    else
      goOnRide
    end
  end

  private

  def goOnRide
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end


  def hasEnoughTickets?
    user.tickets > attraction.tickets
  end

  def isTallEnough?
    user.height > attraction.min_height
  end


end
