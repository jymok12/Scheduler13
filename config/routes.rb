Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
