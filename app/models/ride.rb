class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @message = ""
    att = Attraction.find_by(id: self.attraction_id)
    if user.tickets < att.tickets && user.height < att.min_height
      
      @message = "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      if user.tickets >= att.tickets && user.height >= att.min_height
        user.tickets -= att.tickets
        user.nausea += att.nausea_rating
        user.happiness += att.happiness_rating
        user.save 
        @message = "Thanks for riding the #{attraction.name}!"
      elsif user.height < att.min_height
        # @message = "You are not tall enough to ride the #{attraction.name}"
       @message = "Sorry. You are not tall enough to ride the #{attraction.name}."
      elsif user.tickets < att.tickets
          # @message = "You do not have enough tickets the #{attraction.name}"
        @message = "Sorry. You do not have enough tickets the #{attraction.name}."
      end
    end
    @message
  end

  def flash_message(string)
   @message = string.gsub("Sorry. ", "")
  end

end