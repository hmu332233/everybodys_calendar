class CalendarsController < ApplicationController
  
  def index
    @calendars = Calendar.all
  end

  def show
    @calendar_id = params[:id]
   
    @calendar = Calendar.find(@calendar_id)
    @posts = @calendar.posts
  end

  def create
    name = params[:name]
    Calendar.create(name: name)
  end

  def update
  end

  def delete
  end

  def edit
  end

  def new
  end
end
