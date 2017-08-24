Rails.application.routes.draw do

  get 'comments/create'

  get 'comments/update'

  get 'comments/delete'

  root 'posts#index'
  devise_for :users

  resources :posts
  resources :calendars
  resources :events
  
  get '/calendars/:calendar_id/events' => 'events#index'
  get '/calendars/:calendar_id/events/new' => 'events#new'
  
  get '/calendars/:calendar_id/events/hash_tags/:hash_tag' => 'events#findByHashTag'

end
