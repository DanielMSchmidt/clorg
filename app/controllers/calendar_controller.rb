class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end

  def show
  	@year = (params[:year] || (Time.zone || Time).now.year).to_i
  	@weeknr = (params[:weeknumber] || (Time.zone || Time).now.strftime("%W")).to_i
	  monday =  Date.commercial(@year, @weeknr, 1)
	  friday =  Date.commercial(@year, @weeknr, 7)
    @events = Event.all
  	#@events = Event.where(:start_at => monday..friday)
  end
  
end
