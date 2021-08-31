Rails.application.routes.draw do
  resources :communities
  resources :post
  devise_for :user, controllers: { registrations: 'registrations' }
  root 'post#index'
end
