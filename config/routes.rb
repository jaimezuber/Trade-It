Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bios, only: %i[new create index show]
  resources :users do
    resources :subscriptions, only: %i[new create]
  end
  resources :exchanges, only: %i[new create]
  resources :subscriptions, only: :index
  resources :positions, only: :index
  resources :trades, only: %i[new create]
  get 'profile', to: 'bios#profile', as: :profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
