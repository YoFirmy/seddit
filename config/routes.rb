# frozen_string_literal: true

Rails.application.routes.draw do
  resources :communities, param: :name
  resources :post
  devise_for :user, controllers: { registrations: 'registrations' }
  get 'user/:id', to: 'user#show'
  root 'post#index'
end
