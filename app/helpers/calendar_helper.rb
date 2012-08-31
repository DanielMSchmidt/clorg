module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  def previous_week(week_date)
  	date = week_date - 1.week
  	link_to(I18n.localize(date, :format => "Woche %W"), {:weeknr => date.cweek, :year => date.cwyear})
  end
  def next_week(week_date)
  	date = week_date + 1.week
  	link_to(I18n.localize(date, :format => "Woche %W"), week_calendar_path({:weeknumber => date.cweek, :year => date.cwyear}))
  end
end
