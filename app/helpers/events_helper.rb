module EventsHelper
	def short_name(text, length = 9)
    return text[0..length] + "..." if text.length > length
    return text
  end
end
