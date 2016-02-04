Rails.application.routes.draw do
  namespace :admin do
    root "subjects#index"
    resources :users
    resources :subjects, except: [:show]
  end

  devise_for :users, only: [:session, :registration]
  root "exams#index"
  resources :users, only: [:show]
  resources :exams
  resources :questions, except: [:show]
end
