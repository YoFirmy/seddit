# frozen_string_literal: true

Rails.application.routes.draw do
  resources :communities, param: :name
  patch '/community/:name/join', to: 'communities#join'
  patch '/community/:name/leave', to: 'communities#leave'
  resources :post
  devise_for :user, controllers: { registrations: 'registrations' }
  get 'user/:id', to: 'user#show'
  root 'post#index'
end
