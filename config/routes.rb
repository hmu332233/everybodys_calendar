Rails.application.routes.draw do

  root 'posts#index'
  devise_for :users

  resources :posts
  resources :calendars
  resources :events
  
  get '/calendars/:calendar_id/events' => 'events#index'
  get '/calendars/:calendar_id/events/new' => 'events#new'
  
  get '/calendars/:calendar_id/events/hash_tags/:hash_tag' => 'events#findByHashTag'

end
