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
  end

  def edit
  end
end
