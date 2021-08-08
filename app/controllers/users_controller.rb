class UsersController < ApplicationController
	before_action  :require_logged_in, only: [:show]

	def new
		@user = User.new
	end

	def show 
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to new_user_path
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
	end

end