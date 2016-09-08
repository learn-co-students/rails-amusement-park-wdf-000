class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.height < attraction.min_height && (user.tickets == nil || user.tickets < attraction.tickets)
      "Sorry. You do not have enough tickets the #{attraction.name}." + " " + 
      "You are not tall enough to ride the #{attraction.name}." 
    elsif self.user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}." 
    elsif user.tickets == nil || user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    else
      self.user.tickets -= attraction.tickets 
      self.user.nausea += attraction.nausea_rating
      self.user.happiness += attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
