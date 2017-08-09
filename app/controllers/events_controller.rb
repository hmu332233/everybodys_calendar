class EventsController < ApplicationController
  def index
    render json: Event.all.to_json
  end
  
  def new
    @calendar_id = params[:calendar_id]
  end

  def show
    @event = Event.find(params[:id])
  end

  def delete
  end

  def update
  end

  def create
    _calendar_id = params[:calendar_id]
    _title = params[:title]
    _content = params[:content]
    _start = params[:start]
    _end = params[:end]
    
    Event.create(title: _title, content: _content, start: _start, end: _end, calendar_id: _calendar_id)
    redirect_to calendar_path(_calendar_id)
  end

  def edit
  end
end
