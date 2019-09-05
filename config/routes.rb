Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  resources :articles, only: [:index, :show]
  match '/admin', to: 'dashboard#index', via: :get
  namespace :admin do
    resources :articles
    resources :users
    resources :dashboards, only: [:index]
  end
  root :to => 'articles#index'
end
