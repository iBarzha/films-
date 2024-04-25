Rails.application.routes.draw do
  get 'films_by_genre/index'
  get 'films_by_author/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'
  get 'search', to: 'films#search'
  devise_for :users

  resources :films, only: [:show]

  resources :authors do
    resources :films, only: [:index], controller: 'films_by_author'

  end
  resources :genres do
    resources :films, only: [:index], controller: 'films_by_genre'

  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :films do
    resources :comments, only: [:create, :destroy]
  end

  root 'welcome#index'
  get "up" => "rails/health#show", as: :rails_health_check
end