class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)

    #getting right events
    @start = @shown_month.monday
    @ending = last_sunday(@start)
    @events = Event.where( start_at: @start..@ending)
  end

  def show
  	@year = (params[:year] || (Time.zone || Time).now.year).to_i
  	@weeknr = (params[:weeknumber] || (Time.zone || Time).now.strftime("%W")).to_i
	  monday =  Date.commercial(@year, @weeknr, 1)
	  friday =  Date.commercial(@year, @weeknr, 7)
  	@events = Event.where(:start_at => monday..friday)
  end
  
  protected
  def last_sunday(start_date)
    date = start_date + 1.month - 1.day
    while !date.sunday?
      date += 1.day
    end
    return date
  end
end
