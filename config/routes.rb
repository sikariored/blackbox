Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'static#home'

  resources :admin
  resources :users
  resources :roles
  resources :departments

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
