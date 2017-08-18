class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_basic_data
  
  def set_basic_data
    @calendars = Calendar.all
    @posts = Post.all
  end
end