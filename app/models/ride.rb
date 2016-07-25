class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    denial_message = ""
    if user.tickets < attraction.tickets
      denial_message += "Sorry. You do not have enough tickets the #{attraction.name}."
    end
    if user.height < attraction.min_height
      denial_message += (denial_message == "" ? "Sorry." : "") + " You are not tall enough to ride the #{attraction.name}."
    end
    
    if denial_message == ""
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    else
      denial_message
    end
  end
end
