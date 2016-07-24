class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    message = ""
    if user.tickets < attraction.tickets
      message += "Sorry. You do not have enough tickets the #{attraction.name}."
    end
    if user.height < attraction.min_height
      message += (message == "" ? "Sorry." : "") + " You are not tall enough to ride the #{attraction.name}."
    end
    
    if message == ""
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    else
      message
    end
  end
end
