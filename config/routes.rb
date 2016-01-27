Rails.application.routes.draw do

  devise_for :models
  root "static_pages#home"
end
