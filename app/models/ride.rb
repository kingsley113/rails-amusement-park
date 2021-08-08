class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		user = self.user
		attraction = self.attraction
		# not tall enough and not enough tickets
		if !enough_tickets?(user, attraction) && !tall_enough?(user, attraction)
			return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		# not having enough tickets
		elsif !enough_tickets?(user, attraction)
			return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
		# not being tall enough
		elsif !tall_enough?(user, attraction)
			return "Sorry. You are not tall enough to ride the #{attraction.name}."
		end
		# update ticket number
		user.tickets -= attraction.tickets
		# update user nausea
		user.nausea += attraction.nausea_rating
		# update user happiness
		user.happiness += attraction.happiness_rating
		
		user.save
		return "Thanks for riding the #{attraction.name}!"
	end

	private

	def tall_enough?(user, attraction)
		user.height > attraction.min_height
	end

	def enough_tickets?(user, attraction)
		user.tickets > attraction.tickets
	end
end
