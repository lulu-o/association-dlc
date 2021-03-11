Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :partners, only: [:index, :show] 
  resources :users, only: [:show, :edit, :update] do
  	resources :favorites, only: [:index, :create, :update]
  end
	resources :favorites, only: [:destroy]
  resources :harvests, only: [:index, :show]
end