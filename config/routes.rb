Rails.application.routes.draw do
  root 'static_pages#top'

  resources :reservations do
    collection do
      get :confirm_reservation
    end
    member do
      get :edit_reserve
      post :update_reserve
    end
  end
  resources :stores

  get 'users/index'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: "omniauth_callbacks"
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
