class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    message = "Sorry. "
      if self.attraction.tickets > self.user.tickets
        message += "You do not have enough tickets the #{self.attraction.name}."
      end
      if self.attraction.min_height > self.user.height
        message += " " if !(message == "Sorry. ")
        message += "You are not tall enough to ride the #{self.attraction.name}."
      end
      if message == "Sorry. "
        self.user.happiness += self.attraction.happiness_rating
        self.user.tickets -= self.attraction.tickets
        self.user.nausea += self.attraction.nausea_rating
        self.user.save
      end
      message if !(message == "Sorry. ")
  end


end
