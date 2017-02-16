Rails.application.routes.draw do
  devise_for :users

  resources :wikis

  root 'wikis#index'

  # namespace :user do
  #   root 'wikis#index'
  # end
end
