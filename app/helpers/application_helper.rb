module ApplicationHelper

	def btn_link_to(title, link, btn_typ="", options={})

		c = "btn " + btn_typ
		link_to title, link, :class => c, :html_options => options

	end
	def ca_li_link_to(title, link, action=title.downcase ,options={})
		if controller.action_name == action
			c = "active"
		end
		raw("<li class='#{c}'>" + (link_to title, link, options) + "</li>")
	end
end
