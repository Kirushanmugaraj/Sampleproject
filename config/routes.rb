Rails.application.routes.draw do

  devise_for :users, skip: :registrations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root to: 'dashboards#index'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users
  resources :dashboards, only: :index

  namespace :admin do
    resources :users, only: [:index, :show, :destroy] do
      get :education_details
      get :professional_details
    end
  end

  namespace :end_users do
    resources :users, only: [:edit, :show, :update]
  end

end
