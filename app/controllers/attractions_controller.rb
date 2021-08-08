class AttractionsController < ApplicationController
	before_action :require_admin_privilages, only: [:new, :edit]

	

	def index
		@attractions = Attraction.all
	end

	def new
		@attraction = Attraction.new
	end

	def show
		set_attraction
	end

	def create
		attraction = Attraction.new(attraction_params)
		# fill in create code here
		if attraction.save
			redirect_to attraction_path(attraction)
		else
			render 'attraction#new'
		end
	end

	def edit
		set_attraction
	end

	def update
		set_attraction
		# fill in edit code here
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end
end

