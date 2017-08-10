class EventsController < ApplicationController
  def index
    
    render json: Calendar.find(params[:calendar_id]).events.to_json
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
    _hash_tag_names = params[:hash_tag].split(', ')
    
    hash_tags = HashTag.find_by_name_or_save(_hash_tag_names)
    
    event = Event.new(title: _title, content: _content, start: _start, end: _end, calendar_id: _calendar_id)
    event.hash_tags = hash_tags
    event.save
    
    redirect_to calendar_path(_calendar_id)
  end

  def edit
  end
  
  #---
  
  
end
