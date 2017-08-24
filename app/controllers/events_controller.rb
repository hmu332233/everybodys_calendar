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
    
    _post_id = params[:post_id]
    
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
    
    if _post_id.nil?
      redirect_to calendar_path(_calendar_id)
    else
      saveComment(event, _post_id)
      redirect_to post_path(_post_id)
    end
    
  end

  def edit
  end
  
  #---
  
  def findByHashTag
    _calendar_id = params[:calendar_id]
    _hash_tag_names = params[:hash_tag].split(', ')
    
    events = []
    _hash_tag_names.each do |hash_tag_name|
      events += Event.find_by_tag_name_at_calendar(_calendar_id, hash_tag_name)
    end
    events.uniq!{|e| e.id }
    render json: events.to_json
  end
  
  def saveComment(event, post_id)
    
    Comment.create(content: "#{event.start} - #{event.end}", writer: current_user.name, post_id: post_id)
    
  end
end
