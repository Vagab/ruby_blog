Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:index, :show]
  namespace :admin do
    match '/', to: 'dashboards#index', via: :get
    resources :articles
    resources :users
    resources :dashboards, only: [:index]
    resources :useful_links
  end
  root :to => 'articles#index'
end
