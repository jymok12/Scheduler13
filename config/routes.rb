Rails.application.routes.draw do
  root to: 'home#index'
  #get 'home/index'
  devise_for :users
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
