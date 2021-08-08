class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	helper_method :current_user

	def current_user
		# user = User.find(session[:user_id])
		session[:user_id]
	end


	def require_logged_in
		redirect_to root_path unless current_user
	end

	# def user_is_admin
	# 	user = User.find(current_user)
	# 	user.admin
	# end

	def require_admin_privilages
		user = User.find(current_user)
		redirect_to root_path unless user.admin
	end
end
