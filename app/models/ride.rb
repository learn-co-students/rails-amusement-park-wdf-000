class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    answer = ["Sorry."]
    if self.user.tickets < self.attraction.tickets
      answer << "You do not have enough tickets the #{attraction.name}."
    end
    if self.attraction.min_height > self.user.height
      answer << "You are not tall enough to ride the #{attraction.name}."
    end

    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save

    if answer.count == 1
      return "Thanks for riding the #{attraction.name}!"
    end

    if answer.count == 2 && answer[1].include?("tall")

      self.user.tickets += self.attraction.tickets
      self.user.nausea -= self.attraction.nausea_rating
      self.user.happiness -= self.attraction.happiness_rating
      self.user.save
      return answer.join(" ")
    end

    if answer.count == 2 && answer[1].include?("tickets")

      self.user.tickets += self.attraction.tickets
      self.user.nausea -= self.attraction.nausea_rating
      self.user.happiness -= self.attraction.happiness_rating
      self.user.save
      return answer.join(" ")
    end

    self.user.tickets += self.attraction.tickets
    self.user.nausea -= self.attraction.nausea_rating
    self.user.happiness -= self.attraction.happiness_rating
    self.user.save


    answer.join(" ")


  end
end
