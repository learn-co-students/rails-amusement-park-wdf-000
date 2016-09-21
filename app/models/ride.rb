class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets - self.attraction.tickets < 0 && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets for the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets - self.attraction.tickets < 0
      "Sorry. You do not have enough tickets for the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      tickets_left = self.user.tickets - self.attraction.tickets
      nausea_status = self.user.nausea +  self.attraction.nausea_rating
      happiness_level = self.user.happiness +  self.attraction.happiness_rating
      self.user.update(tickets: tickets_left, nausea: nausea_status, happiness:  happiness_level)
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end
