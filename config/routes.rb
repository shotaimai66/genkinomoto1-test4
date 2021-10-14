Rails.application.routes.draw do
  root 'static_pages#top'

  get 'users/index'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }

  resources :staffs, only: %i[index]

  resources :reservations
  resources :stores
  
  resources :items do
    collection do
      get 'search'
    end
  end

end
