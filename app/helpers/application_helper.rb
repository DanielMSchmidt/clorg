module ApplicationHelper

	def btn_link_to(title, link, btn_typ="")

		c = "btn " + btn_typ
		content_tag :a, title, :class => c, :href => link

	end
end
