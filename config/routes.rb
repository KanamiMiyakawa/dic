Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :users, only: [:new, :create, :show, :edit, :update]
end
