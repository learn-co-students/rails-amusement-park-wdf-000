class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    error = "Sorry." 
    if self.user.tickets < self.attraction.tickets
      error << " You do not have enough tickets the #{self.attraction.name}."
    end

    if self.user.height < self.attraction.min_height
      error << " You are not tall enough to ride the #{attraction.name}."
    end

    if error != "Sorry."
      return error
    else
      new_tickets = self.user.tickets - self.attraction.tickets
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_happiness = self.user.happiness + self.attraction.happiness_rating

      self.user.update(
        :happiness => new_happiness,
        :tickets => new_tickets,
        :nausea => new_nausea
      )

      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end

