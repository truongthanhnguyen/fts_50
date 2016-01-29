Rails.application.routes.draw do
  devise_for :users, only: [:session, :registration]
    
  root "static_pages#home"
  resources :users, only: [:show]
  
  resources :exams
end
