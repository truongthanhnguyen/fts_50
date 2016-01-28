Rails.application.routes.draw do

  devise_for :users, only: [:session, :registrations]
  root "static_pages#home"
end
