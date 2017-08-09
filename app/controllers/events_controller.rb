class EventsController < ApplicationController
  def index
    render json: Event.all.to_json
  end
  
  def new
  end

  def show
  end

  def delete
  end

  def update
  end

  def create
    _title = params[:title]
    _content = params[:content]
    _start = params[:start]
    _end = params[:end]
    
    Event.create(title: _title, content: _content, start: _start, end: _end)
  
  end

  def edit
  end
end
