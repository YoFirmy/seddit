Rails.application.routes.draw do
  resources :post
  devise_for :user, controllers: { registrations: 'registrations' }
  root 'post#index'
end
