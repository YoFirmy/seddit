Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: 'registrations' }
  root 'home#index'
end
