Rails.application.routes.draw do
  get 'results/index'
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions',
  }
  root 'static#home'

  get 'upanel', to: 'static#upanel', as: 'upanel'

  namespace :admin do
    get 'cpanel', to: 'admin#cpanel', as: 'cpanel'
    resources :users do
      member do
        patch 'remove_from_department', to: 'users#remove_from_department'
      end
    end
    resources :departments
    resources :roles
  end

  resources :secure_records
  resources :notes

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
