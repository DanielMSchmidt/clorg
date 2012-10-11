module CalendarHelper
  def month_link(month_date, tag=nil)
    if tag.nil?
      link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
    else
      link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year, :tag => tag})
    end    
  end

  def previous_week(week_date, tag=nil)
  	date = week_date - 1.week
    if tag.nil?
      link_to(I18n.localize(date, :format => "Woche %W"), {:weeknr => date.cweek, :year => date.cwyear})
    else
      link_to(I18n.localize(date, :format => "Woche %W"), {:weeknr => date.cweek, :year => date.cwyear, :tag => tag})
    end  	
  end

  def next_week(week_date, tag=nil)
  	date = week_date + 1.week
    if tag.nil?
      link_to(I18n.localize(date, :format => "Woche %W"), week_calendar_path({:weeknumber => date.cweek, :year => date.cwyear}))
    else
      link_to(I18n.localize(date, :format => "Woche %W"), week_calendar_path({:weeknumber => date.cweek, :year => date.cwyear, :tag => tag}))
    end
  end

  def get_whole_day(day)
    (day.to_time .. day.to_time.end_of_day)
  end

  def is_at_day(day, event)
    return day.cover?(event.start_at) && day.cover?(event.end_at)
  end
end
