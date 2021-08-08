module UsersHelper

	def user_is_admin?
		user = User.find(current_user)
		user.admin
	end

end
