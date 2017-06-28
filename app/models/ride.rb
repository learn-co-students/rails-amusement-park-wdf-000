class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		if too_short && too_poor
			"Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		elsif too_short
			"Sorry. You are not tall enough to ride the #{attraction.name}." 
		elsif too_poor
			"Sorry. You do not have enough tickets the #{attraction.name}."
		else
			self.user.tickets = self.user.tickets - self.attraction.tickets
			self.user.nausea = self.user.nausea + self.attraction.nausea_rating
			self.user.happiness = self.user.happiness + self.attraction.happiness_rating
			self.user.save
			"Thanks for riding the #{self.attraction.name}!"
		end
	end

	def too_short
		self.user.height < self.attraction.min_height
	end

	def too_poor
		self.user.tickets < self.attraction.tickets
	end
end
