class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  # validates :user_id, :presence => true
  # validates :attraction_id, :presence => true


  def take_ride
    # binding.pry
    # if ((self.user.tickets < self.attraction.tickets) && (self.user.height < self.attraction.min_height))

        if self.user.tickets < self.attraction.tickets && !(self.user.height < self.attraction.min_height)
          "Sorry. You do not have enough tickets the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height && !(self.user.tickets < self.attraction.tickets)
          "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
          "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        else
          # binding.pry
          self.user.happiness += attraction.happiness_rating
          self.user.nausea += attraction.nausea_rating
          self.user.tickets -= self.attraction.tickets
          self.user.save
          "Thanks for riding the #{attraction.name}!"
          # binding.pry
        end

    end



end
