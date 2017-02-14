Rails.application.routes.draw do
  devise_for :users

  resources :wikis, only: [:create, :new, :edit, :show, :destroy, :update]

  get 'welcome/index'

  root 'welcome#index'
end
