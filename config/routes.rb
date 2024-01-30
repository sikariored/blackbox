Rails.application.routes.draw do
  get 'results/index'
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'static#home'

  resources :admin

  resources :users do
    member do
      patch 'remove_from_department', to: 'users#remove_from_department'
    end
  end

  resources :roles

  resources :departments

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
