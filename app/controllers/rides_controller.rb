class RidesController < ApplicationController

	def create
		# byebug
		ride = Ride.create(ride_params)
		message = ride.take_ride
		# redirect_to user_path(ride.user)

		redirect_to user_path(ride.user), alert: message
	end


	private

	def ride_params
		params.require(:ride).permit(:user_id, :attraction_id)
	end

end