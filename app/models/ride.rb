class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    bo1 = user.tickets < attraction.tickets
    bo2 = user.height < attraction.min_height
    if bo1 && bo2
      return "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif bo1
      return "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif bo2
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
  end
end
