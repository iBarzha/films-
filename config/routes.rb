Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'
  devise_for :users

  resources :films, only: [:show]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :films do
    resources :comments, only: [:create, :destroy]
  end

  root 'welcome#index'
  get "up" => "rails/health#show", as: :rails_health_check
end
