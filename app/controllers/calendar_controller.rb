class CalendarController < ApplicationController
  before_filter :get_tags
  before_filter :set_globals
  # TODO: Presenter maybe?
  # TODO: Helpermethod!

  def index
    @tag = Tag.find(params[:id])
    @start = @shown_month.monday
    @ending = last_sunday(@start)
    if @tag.nil?
      @events = Event.where( start_at: @start..@ending)  
    else
      @events = Event.where( start_at: @start..@ending, tag_id: @tag.id)
    end    
  end

  def show
	  monday =  Date.commercial(@year, @weeknr, 1)
	  friday =  Date.commercial(@year, @weeknr, 7)
    if @tag.nil?
  	  @events = Event.where(start_at: monday..friday)
    else
      @events = Event.where( start_at: monday..friday, tag_id: @tag.id)
    end
  end

  def get_tags
    @tags = Tag.all
  end

  def set_globals
    @weeknr = (params[:weeknumber] || (Time.zone || Time).now.strftime("%W")).to_i
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
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
