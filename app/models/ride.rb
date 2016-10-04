class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  attr_accessor :flash_notice

  def take_ride
    # put flash messages here?
    @user = User.find(user_id)
    @attraction = Attraction.find(attraction_id)
    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      self.flash_notice = "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      self.flash_notice = "Sorry. You do not have enough tickets the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      self.flash_notice = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      # all the updating here - user can access attraction
      self.flash_notice = "Thanks for riding the #{attraction.name}!"
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
    end
  end

end
