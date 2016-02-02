Rails.application.routes.draw do
  namespace :admin do
    root "users#index"
    resources :users
  end

  devise_for :users, only: [:session, :registration]
  root "static_pages#home"
  resources :users, only: [:show]
  resources :exams
end
