Rails.application.routes.draw do
  root 'static_pages#top'

  resources :reservations
  resources :stores
  
  devise_for :users
end
