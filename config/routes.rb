Rails.application.routes.draw do
  get 'stores/index'
  get 'stores/show'
  get 'stores/new'
  get 'stores/edit'
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/edit'
  root 'static_pages#top'
  get 'users/index'

  devise_for :users
end
