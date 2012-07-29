module ApplicationHelper
	def can_delete?(obj)
		return current_user.admin? || current_user.id == obj.user_id
	end
end
