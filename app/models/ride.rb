class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !enough_tickets? && tall_enough?
      return "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif !tall_enough? && enough_tickets?
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !tall_enough? && !enough_tickets?
      return "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end

    tickets_left = self.user.tickets - self.attraction.tickets
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_happiness = self.user.happiness + self.attraction.happiness_rating

    # user = User.find(self.user.id)
    # user.update(
    #   tickets: tickets_left,
    #   nausea: new_nausea,
    #   happiness: new_happiness
    #   )

    self.user.tickets = tickets_left
    self.user.nausea = new_nausea
    self.user.happiness = new_happiness
    self.user.save!

    "Thanks for riding the #{self.attraction.name}!"
  end

private
  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough?
    self.user.height > self.attraction.min_height
  end
end
