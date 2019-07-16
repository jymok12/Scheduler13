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
  get "/app/views/home/about.html.erb", to: "home#about", as: "about"
  get "/app/views/home/staff_list.html.erb", to: "home#staff_list", as: "staff_list"

  get "/app/views/home/signup.html.erb", to: "home#signup", as: "signup"
  get "/app/views/home/signin.html.erb", to: "home#signin", as: "signin"
  get "/app/views/meetings/index.html.erb", to: "meetings#index", as: "book"

end
