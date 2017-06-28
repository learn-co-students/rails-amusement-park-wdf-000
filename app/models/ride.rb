class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message = "Sorry. "
    if attraction.tickets > user.tickets
      message += "You do not have enough tickets the #{attraction.name}. "
    end

    if attraction.min_height > user.height
     message += "You are not tall enough to ride the #{attraction.name}. "
    end

    if message == "Sorry. "
      user.happiness += attraction.happiness_rating
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.save
      message = "Thanks for riding the #{attraction.name}!"
    end
    message.strip unless message == "Sorry. "
  end

end
