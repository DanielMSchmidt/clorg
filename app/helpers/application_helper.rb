module ApplicationHelper

	def btn_link_to(title, link, btn_typ="")

		c = "btn " + btn_typ
		content_tag :a, title, :class => c, :href => link

	end

	def can_delete?(obj)
		return current_user.admin? || current_user.id == obj.user_id
	end
end
