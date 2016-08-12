class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message = "Sorry."
    if !enough_tickets
      message += " You do not have enough tickets the #{attraction.name}."
    end
    if !tall_enough
      message += " You are not tall enough to ride the #{attraction.name}."
    end

    if enough_tickets && tall_enough
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    else
      message
    end
  end

  private

  def enough_tickets
    user.tickets > attraction.tickets
  end

  def tall_enough
    user.height > attraction.min_height
  end

end
