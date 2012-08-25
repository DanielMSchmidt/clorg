module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  def last_sunday(start_date)
  	date = start_date + 1.month - 1.day
  	while !date.sunday?
  		date += 1.day
  	end
  	return date
  end
end
