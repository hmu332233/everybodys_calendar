class PostsController < ApplicationController

  before_action :log_impression, :only=> [:show]
 
def log_impression
    @hit_post = Post.find(params[:id])
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address:request.remote_ip)
end

  def index
     @posts = Post.all.reverse
  end
  
  
  def create
    
     _title = params[:title]
    _writer = params[:writer]
    _content = params[:content]
    
    Post.create(title: _title, writer: _writer, content: _content)
    
    redirect_to "/posts"
    
  end
  
  def destroy
    id = params[:id]
    
    post = Post.find(id)
    post.delete
    
    redirect_to "/posts"
    
  end
  
  def edit
    _id = params[:id]
    
    @post = Post.find(_id)
  end
  
  def update
    _id = params[:id]
    _title = params[:title]
    _writer = params[:writer]
    _content = params[:content]
    
    
    post = Post.find(_id)
    
    post.update(title: _title, writer: _writer, content: _content)
    redirect_to "/posts"
  end
  
  def new
  end
  
  def show
    id = params[:id]
    
    @post = Post.find(id)
    
    
render layout: "calendars"
  end


  
end
