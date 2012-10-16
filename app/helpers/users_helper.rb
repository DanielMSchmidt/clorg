module UsersHelper
	def can_delete?(object)
		return current_user.admin?
	end
end
