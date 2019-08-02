Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
  end
end
