Rails.application.routes.draw do
  resources :meetings
  resources :bookings
  resources :schedules
  resources :accounts
  resources :students
  resources :educators
  resources :appointments
  root to: 'home#index'
  #get 'home/index'
  devise_for :users, path: 'users'   #route!!!!!!!!

  devise_for :staffs, path: 'staffs'

  #get "/app/views/home/calendar.html.erb", to: "home#calendar", as: "calendar"
  get "/app/views/home/index.html.erb", to: "home#index", as: "index"
  get "/app/views/home/signup.html.erb", to: "home#signup", as: "signup"
  get "/app/views/home/signin.html.erb", to: "home#signin", as: "signin"
  get "/app/views/meetings/index.html.erb", to: "meetings#index", as: "book"




  #root "home#index"
  #as :user do
  #get 'sign_in', :to => 'devise/registrations#new'
  #end

  #devise_scope :user do
  #  get 'register', to: 'devise/registrations#new', as: :register
  #  get 'login', to: 'devise/sessions#new', as: :login
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
