class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # binding.pry
    # logic
    if not_enough([["tickets", "tickets"], ["height", "min_height"]])
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough([["tickets", "tickets"]])
      "Sorry. You do not have enough tickets the #{attraction.name}."
      # binding.pry
    elsif not_enough([["height", "min_height"]])
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def not_enough(args)
    args.all? { |a| self.user.send(a[0]) < self.attraction.send(a[1]) }
  end
end
