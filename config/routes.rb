Rails.application.routes.draw do
  resources :post
  devise_for :user, controllers: { registrations: 'registrations' }
  root 'home#index'
end
