Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bios, only: %i[index show]
  resources :users do
    resources :subscriptions, only: %i[new create]
  end
  resources :exchanges, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
