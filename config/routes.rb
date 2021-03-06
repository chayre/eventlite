Rails.application.routes.draw do
  # Devise routes
  devise_for :users, controllers: { 
  passwords:          'users/passwords',
  registrations:      'users/registrations',
  sessions:           'users/sessions',
  }
  resources :events
  resources :users, only: [:show, :edit]
  resources :event_attendees, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
