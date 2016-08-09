class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    errors = ["Sorry."]
    if attraction.tickets > user.tickets
      errors << "You do not have enough tickets the #{attraction.name}."
    end
    if attraction.min_height > user.height
      errors << "You are not tall enough to ride the #{attraction.name}."
    end
    if errors.count > 1
      errors.join(" ")
    else 
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
