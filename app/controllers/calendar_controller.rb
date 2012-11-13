class CalendarController < ApplicationController

  #FIXME Consider Presenter!
  def index
    @tags = Tag.all
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)

    #getting right events
    @start = @shown_month.monday
    @ending = last_sunday(@start)

    @activeTag = params[:tag]
    if @activeTag
      @events = Event.tagged_with(@activeTag).within(@start, @ending)
    else
      @events = Event.within(@start, @ending)
    end
  end

  def show
    @tags = Tag.all
  	@year = (params[:year] || (Time.zone || Time).now.year).to_i
  	@weeknr = (params[:weeknumber] || (Time.zone || Time).now.strftime("%W")).to_i
	  monday =  Date.commercial(@year, @weeknr, 1)
	  friday =  Date.commercial(@year, @weeknr, 7)

    @activeTag = params[:tag]
    if @activeTag
      @events = Event.tagged_with(@activeTag).within(monday, friday)
    else
      @events = Event.within(monday, friday)
    end
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
