class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction



  def take_ride
    if invalid_height && invalid_tickets
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif invalid_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif invalid_tickets
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    else
      update_ticket
      update_nausea
      update_happiness
    end
  end


  def invalid_height
    user.height < self.attraction.min_height

  end

  def invalid_tickets
    user.tickets < self.attraction.tickets
  end

  def update_ticket
    new_ticket_count = user.tickets - self.attraction.tickets
    user.update(tickets: new_ticket_count)
  end

  def update_nausea
    new_nausea_count = user.nausea + self.attraction.nausea_rating
    user.update(nausea: new_nausea_count)
  end

  def update_happiness
    update_happiness = user.happiness + self.attraction.happiness_rating
    user.update(happiness: update_happiness)
  end








end
