Rails.application.routes.draw do
  devise_for :users

  resources :wikis, except: [:index]

  root 'welcome#index'
end
