module EventsHelper
	def short_name(text, length = 9)
    return text[0..length] + "..." if text.length > length
    return text
  end
  def new_event(day)
  	"window.location = '#{new_event_path(:start_at => day)}'"
  end
end
