Rails.application.routes.draw do
  resources :calendars
  resources :events

  get '/calendars/:calendar_id/events' => 'events#index'
  get '/calendars/:calendar_id/events/new' => 'events#new'
end
