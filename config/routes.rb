Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :blogs
  resources :sessions, only: [:new, :create, :destroy]
end
