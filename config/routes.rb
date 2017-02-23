Rails.application.routes.draw do
  devise_for :users

  resources :wikis
  resources :charges, only: [:new, :create]

  root 'wikis#index'

  # namespace :user do
  #   root 'wikis#index'
  # end
end
