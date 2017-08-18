class CalendarsController < ApplicationController
  def index
  end

  def show
    @calendar_id = params[:id]
    
    @calendar = Calendar.find(@calendar_id)
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
