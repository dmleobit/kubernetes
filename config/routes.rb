require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :books
  get 'redis', to: 'home#redis'

  root 'home#index'
end
