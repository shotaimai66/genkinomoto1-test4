Rails.application.routes.draw do
  root 'static_pages#top'

  resources :reservations
  resources :stores
  
  get 'users/index'
  devise_for :users
end
