class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find(user_id)
    attraction = Attraction.find(attraction_id)
    processed = process_requirements(user, attraction)
    return processed unless processed == 'pass'
    update_attributes(user, attraction)
  end

  def process_requirements(user, attraction)
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets the #{attraction.name}."\
      + ' You are not tall enough to ride the Roller Coaster.'
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets the #{attraction.name}."
    end
    'pass'
  end

  def update_attributes(user, attraction)
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
