Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'welcome#index'
  namespace :admin do
    resources :poorfarmers
    resources :effects
    resources :aids
    resources :funds
    resources :judgments
    resources :policies
    resources :categories
    resources :villages
  end
  resources :poorfarmers
  resources :effects
  resources :aids
  resources :funds
  resources :judgments
  resources :policies
  resources :villages
end
