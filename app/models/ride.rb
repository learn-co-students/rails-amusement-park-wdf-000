class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !valid_tickets? && !valid_height?
      @message = "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !valid_height?
      @message = "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !valid_tickets?
      @message = "Sorry. You do not have enough tickets the #{attraction.name}."
    else
      user.update(tickets: (user.tickets - attraction.tickets))
      user.update(nausea: (user.nausea + attraction.nausea_rating))
      user.update(happiness: (user.happiness + attraction.happiness_rating))
      @message = "Thanks for riding the #{attraction.name}!"
    end

  end

  def valid_tickets?
    user.tickets > attraction.tickets
  end

  def valid_height?
    user.height > attraction.min_height
  end



end
