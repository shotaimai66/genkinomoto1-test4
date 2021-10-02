Rails.application.routes.draw do
  root 'static_pages#top'

  resources :reservations
  resources :stores

  get 'users/index'
  devise_for :users
  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  resources :staffs, only: %i[index]
end
